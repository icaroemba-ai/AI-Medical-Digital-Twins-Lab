
% Synthetic cardiac-synchronous reference signal
% (represents ECG-derived cardiac timing, not ECG morphology)

% 1. Create a wandering heart rate (Frequency Modulation)
t = t_vector';
wandering_freq = 1.0 + 0.3 * sin(2*pi*0.05*t); 
phase = cumsum(wandering_freq * dt); % Integrate frequency to get phase

% 2. Create the chaotic disturbance (Fluid Hammer + Breathing + Random)
chaotic_disturbance = 5.0 * sin(2*pi * phase) + 1.5 * sin(2*pi*0.2*t) + 0.5 * randn(length(t), 1);
simulink_data.signals.values = chaotic_disturbance;

% 3. Create the ECG Reference Sensor (Tracks the wandering HR)
cardiac_phase_ref = 1.0 * sin(2*pi * phase); % Simple wave phase-locked to the heartbeat
cardiac_ref_data = struct();
cardiac_ref_data.time = [];
cardiac_ref_data.signals.values = cardiac_phase_ref;
cardiac_ref_data.signals.dimensions = 1

