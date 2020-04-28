clear all;
%load files
load("dataset_7to1 path");
load("dataset_1to21 path");
load("anxious depression keywords file path");

% calculate top 10 frequency keywords during and after quarantine
Top10Keywords_1to21=[];
for i=1:21;
    dailydata=dataset_1to21(dataset_1to21(:,4)==string(i),5:end);
    dailydata=lower(dailydata);%"ABC“ to "abc"
    [words,~,idx]=unique(dailydata);
    numOccurrences=histcounts(idx,numel(words));
    [rankOfOccurrences,rankIndex] = sort(numOccurrences,'descend');
    wordsByFrequency =words(rankIndex);
    dailywordsFrequency=[wordsByFrequency,transpose(rankOfOccurrences)];
    loc=ismember(dailywordsFrequency(:,1),keywords);
    k=find(loc);
    for j=1:10;
        TopKeywords=[i,dailywordsFrequency(k(j),:)];
        Top10Keywords_1to21=[Top10Keywords_1to21;TopKeywords];
    end
end

% calculate top 10 frequency keywords before quarantine
Top10Keywords_7to1=[];
for i=-7:-1;
    dailydata=dataset_7to1(dataset_7to1(:,4)==string(i),5:end);
    dailydata=lower(dailydata);%"ABC“ to "abc"
    [words,~,idx]=unique(dailydata);
    numOccurrences=histcounts(idx,numel(words));
    [rankOfOccurrences,rankIndex] = sort(numOccurrences,'descend');
    wordsByFrequency =words(rankIndex);
    dailywordsFrequency=[wordsByFrequency,transpose(rankOfOccurrences)];
    loc=ismember(dailywordsFrequency(:,1),keywords);
    k=find(loc);
    for j=1:10;
        TopKeywords=[i,dailywordsFrequency(k(j),:)];
        Top10Keywords_7to1=[Top10Keywords_7to1;TopKeywords];
    end
end
%combine and save two parts
Top10Keywords_7to1to21=[Top10Keywords_7to1;Top10Keywords_1to21];
xlswrite('Top10Keywords_7to1to21',Top10Keywords_7to1to21);

