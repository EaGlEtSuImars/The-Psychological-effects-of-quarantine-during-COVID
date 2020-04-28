% strip tweet text to single words
clear all;
load("datasetfilepath");%load the cleansed dataset which contains username, absolute data and tweet text. 

dataset_nametimedaywords_7to1new=[];%day 7 to day 1 before quarantine
delete_elements=[" ",",",".","-","/","\",":","?","(",")","!","  ",";"];%define the dilimeters
for n=1:length(dataset_7to1);
    tweet_text=lower(dataset_7to1(n,3));
    tweet_text=split(tweet_text,delete_elements);%split by multiple delimiters
    tweet_text(sum(cellfun(@isempty,tweet_text),2)>0,:)=[];%delete the blank
    tweet_text=[tweet_text;strings(150-length(tweet_text),1)];%make the arrary length consistent
    dataset_nametimedaywords_7to1=[dataset_nametimedaywords_7to1,tweet_text];
end
dataset_nametimedaywords_7to1=transpose(dataset,dataset_nametimedaywords_7to1);
save('dataset_nametimedaywords_7to1','dataset_nametimedaywords_7to1');

dataset_nametimedaywords_1to21=[];%day 1 to day 12 during quarantine and day 15 to 21 after quarantine
delete_elements=[" ",",",".","-","/","\",":","?","(",")","!","  ",";"];%define the dilimeters
for n=1:length(dataset_1to21);
    tweet_text=lower(dataset_1to21(n,3));
    tweet_text=split(tweet_text,delete_elements);%split by multiple delimiters
    tweet_text(sum(cellfun(@isempty,tweet_text),2)>0,:)=[];%delete the blank
    tweet_text=[tweet_text;strings(200-length(tweet_text),1)];%make the arrary length consistent
    dataset_nametimedaywords_1to21=[dataset_nametimedaywords_1to21,tweet_text];
end
dataset_nametimedaywords_1to21=transpose(dataset,dataset_nametimedaywords_1to21);
save('dataset_nametimedaywords_1to21','dataset_nametimedaywords_1to21');
%combine "dataset_nametimedaywords_7to1" with
%"dataset_nametimedaywords_1to21" will make the file is so big that it is not easy to output.