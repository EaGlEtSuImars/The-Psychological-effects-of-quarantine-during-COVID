clear all;
% calculate daily keywords occurrence frequency
%step 1: daily psychological level
load("dataset path");%load "dataset_7to1" and "dataset_1to21".
load("file path");%load the keywords (lexicons) of different psychologies.

KeywordsFrequency_1to21=[];%calculate keywords frequency during and after quarantine.
for i=1:21;
    %find someone day first
    Loc=ismember(dataset_1to21(:,4),string(i));
    k=find(Loc);
    tweet_words=dataset_1to21_1to21(k,5:end);
    tweet_words=lower(tweet_words);%"ABC“ to "abc"
    %start to calculate the frequency
    [words,~,idx]=unique(tweet_words);
    numOccurrences=histcounts(idx,numel(words));
    [rankOfOccurrences,rankIndex] = sort(numOccurrences,'descend');
    wordsByFrequency =words(rankIndex);
    allwordsFrequency=[wordsByFrequency,transpose(rankOfOccurrences)];
    Lia=ismember(allwordsFrequency(:,1),keywords);
    j=find(Lia);%find the location
    Keywords_OccurenceAndFrequency=allwordsFrequency(j,:);%the difference
    ToNum=str2num(char(Keywords_OccurenceAndFrequency(:,2)));
    keywordstimes=[i,sum(ToNum)];
    KeywordsFrequency_1to21=[KeywordsFrequency_1to21;keywordstimes];
end

KeywordsFrequency_7to1=[];%calculate keywords frequency before quarantine.
for i=-7:-1;
    %find someone day first
    Loc=ismember(dataset_7to1(:,4),string(i));
    k=find(Loc);
    tweet_words=dataset_7to1(k,5:end);
    tweet_words=lower(tweet_words);%"ABC“ to "abc"
    %start to calculate the frequency
    [words,~,idx]=unique(tweet_words);
    numOccurrences=histcounts(idx,numel(words));
    [rankOfOccurrences,rankIndex] = sort(numOccurrences,'descend');
    wordsByFrequency =words(rankIndex);
    allwordsFrequency=[wordsByFrequency,transpose(rankOfOccurrences)];
    Lia=ismember(allwordsFrequency(:,1),keywords);
    j=find(Lia);%find the location
    Keywords_OccurenceAndFrequency=allwordsFrequency(j,:);%the difference
    ToNum=str2num(char(Keywords_OccurenceAndFrequency(:,2)));
    keywordstimes=[i,sum(ToNum)];
    KeywordsFrequency_7to1=[KeywordsFrequency_7to1;keywordstimes];
end
%combine two datasets
KeywordsFrequency_7to1to21_'PsychologyName'=[KeywordsFrequency_7to1;KeywordsFrequency_1to21];
