Fs = 44100
seconds = 5

recorder = audiorecorder(Fs, 8, 1);

disp('start');
recordblocking(recorder, seconds);
disp('stop')

% play(recorder);

y = getaudiodata(recorder);

audiowrite('./sounds/output/reocrding.wav', y, Fs);

% [y, Fs] = audioread('./song.wav');
[church, Fs_church] = audioread('./sounds/impulse-responses/ir_church.wav');

samplingRates = [24000 16000 8000 4000];
samplingRatesRatio = Fs ./ samplingRates

H24 = y(round((1:(size(y, 1) / samplingRatesRatio(1))) .* samplingRatesRatio(1)));
H16 = y(round((1:(size(y, 1) / samplingRatesRatio(2))) .* samplingRatesRatio(2)));
H8 = y(round((1:(size(y, 1) / samplingRatesRatio(3))) .* samplingRatesRatio(3)));
H4 = y(round((1:(size(y, 1) / samplingRatesRatio(4))) .* samplingRatesRatio(4)));

sound(H24, samplingRates(1))
sound(H16, samplingRates(2))
sound(H8, samplingRates(3))
sound(H4, samplingRates(4))

audiowrite('./sounds/output/reocrding-24000.wav', H24, samplingRates(1));
audiowrite('./sounds/output/reocrding-16000.wav', H16, samplingRates(2));
audiowrite('./sounds/output/reocrding-8000.wav', H8, samplingRates(3));
audiowrite('./sounds/output/reocrding-4000.wav', H4, samplingRates(4));

church_sound = conv(y, church);

sound(church_sound, Fs);
audiowrite('./sounds/output/reocrding-church.wav', church_sound, 44100);
