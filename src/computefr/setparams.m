%SETPARAMS.M
%Set global parameters
%Remember to run this script after updating values

%This file is part of computefr, written by Rajiv Narayan and used with permission.


function setparams()

%current default parameters

fname='params';

	params = struct (...
            'songSampRate',32000,...                    %Sampling Rate of song (hz) 
            'songAxesParams',[1000,5000,0.25,8.0],...   %Axis params for plotting [ms,ms,khz,khz]
            'specFftN',128,...                          %DFT length for spectrogram (samples)
            'specWindow',128,...                        %window size for computing spectrogram (samples)
            'specNumOverlap',64,...                     %spectrogram window overlap (samples)
            'specBandwidth',[250,8000],...              %freqs of interest in the spectrogram (hz)
            'strfSampRate',1000,...                     %Sampling Rate of strf (hz)
            'strfAxesParams',[0,100,0.25,8.0],...       %Axis params for potting strf [ms,ms,khz,khz]
            'strfTScale',[-300:1:300],...               %time scale for strf (ms) 
            'strfFScale',[0.375:0.25:7.875],...         %freq scale for strf (khz) 
            'strfCropRange',[300:399],...               %time of interest in the strf (samples)
            'defaultSongDir','/home/rn/data/strfdata/songs',...  %default directory for songs
            'defaultStrfDir','/home/rn/data/strfdata/strfs',... %default directory for strfs
            'defaultAnalysisDir', '/home/rn/data/strfdata/analysis',... %Defaults dir for analysis files
            'firingOnset',1,...                         %start of stimulus (samples), use to introduce delay
            'firingDuration',6000, ...                  %length of firing rate vector (ms), set to max song length
            'firingRateGain',10.0, ...                    %Firing Rate Scale factor
            'numSpikeTrainsPerSong',10, ...                    %Number of spike trains to generate per song
            'spikeDistTau',10, ...                       %default time constant for spike distance (ms)
            'spikeDistT',6000,...                       %default T value (length of spike train) for spike distance (ms)
            'spikeDistTauRange','1:5:100',...           %Default range of tau values to test (ms)
            'spikeDistTRange','0:200:6000',...         %Default range of T values to test (samples)
            'sterfSignature', 'sterfv1.1'...                    %Current sterf data format version
        );


    
     save(fname,'params')
     s=sprintf('Saved parameters in %s',fname);
     disp(s) 
