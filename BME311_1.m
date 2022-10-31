NUM_BEATS = 15;
BPM = 70; % bpm
V_INF = 320; % mmHg, V_inf for diastole
V_0 = 80; % mmHg, initial voltage / pressure, will change later
TAU = 1.4; % seconds, = RC

time_per_beat = 60/BPM; % the number of seconds that a beat takes
sys_time = .3 * time_per_beat; % amount of time in systole
dia_time = .7 * time_per_beat;% amount of time in diastole


syms t v i % v is V_0, while i is used to adjust time to zero

syms S(t,i) % Pressure in systole
S(t) = 0 + (v - 0)*exp(-(t-i)/TAU);% systole equation

syms D(t,i) % Pressure in diastole
D(t) = V_INF + (v - V_INF)*exp(-(t-i)/TAU);% diastole equation

figure("Name","Pressure vs Time") % creates figure

for beat = 0:NUM_BEATS-1
    start = time_per_beat * beat; % resets time for start of beat
    
    adj_S = subs(S(t), [v i], [V_0 start]); % substitutes constants into function
    fplot(adj_S,[start sys_time+start],'b') % plots systole
    hold on % allows diastole to be plotted on same figure

    V_0 = subs(adj_S, t, sys_time+start); % V at end of systole, V_0 for diastole

    adj_D = subs(D(t), [v,i], [V_0 sys_time+start]); % substitutes constants into function
    fplot(adj_D,[sys_time+start dia_time+sys_time+start],'b') % plots diastole
    hold on 

    V_0 = subs(adj_D, t, dia_time+sys_time+start); % new V_0 for next systole
end

% plotting things
title("Pressure (mmHg) vs Time (s)")
xlabel('Time (s)') 
ylabel('Pressure (mmHg)')
hold off

