clear all;
load("dataset path");%load "datset_7to1" and "dataser_1to21"
% calculate daily total tweet number
DailyTotalNumber_7to1=[];%before quarantine
for i=-7:-1;
    dailytweet=user1278_nametimedaywords_7to1(user1278_nametimedaywords_7to1(:,4)==string(i),1:4);
    subnum=[i,length(dailytweet)];
    DailyTotalNumber_7to1=[DailyTotalNumber_7to1;subnum];
end

DailyTotalNumber_1to21=[];%during and after quarantine
for i=1:21;
    dailytweet=user1278_nametimedaywords_1to21(user1278_nametimedaywords_1to21(:,4)==string(i),1:4);
    subnum=[i,length(dailytweet)];
    DailyTotalNumber_1to21=[DailyTotalNumber_1to21;subnum];
end
%combine two dataset
DailyTotalNumber_7to1to21=[DailyTotalNumber_7to1;DailyTotalNumber_1to21];


% daily keywords-related tweet number
load("keywordsfilepath");%load the keywords of different psychologies
loc=ismember(dataset_7to1(2:end,5:end),keywords);%before quarantine
allrelatedtweetnumber=[];
for i=1:length(loc);
    subloc=sum(loc(i,:));
    if subloc>0;
        arrary=[i,dataset_7to1(i+1,4)];
        allrelatedtweetnumber=[allrelatedtweetnumber;arrary];
    end
end
%combine into each day
DailyRelatedNo_7to1=[];
for i=-7:-1;
    sub=allrelatedtweetnumber(:,2)==string(i);
    k=find(sub);
    subarrary=[i,length(k)];
    DailyRelatedNo_7to1=[DailyRelatedNo_7to1;subarrary];
end

loc=ismember(dataset_1to21(2:end,5:end),keywords);%during and after quarantine
allrelatedtweetnumber=[];
for i=1:length(loc);
    subloc=sum(loc(i,:));
    if subloc>0;
        arrary=[i,dataset_1to21(i+1,4)];
        allrelatedtweetnumber=[allrelatedtweetnumber;arrary];
    end
end
%combine into each day
DailyRelatedNo_1to21=[];
for i=1:21;
    sub=allrelatedtweetnumber(:,2)==string(i);
    k=find(sub);
    subarrary=[i,length(k)];
    DailyRelatedNo_1to21=[DailyRelatedNo_1to21;subarrary];
end   

DailyRelatedNo_7to1to21=[DailyRelatedNo_7to1;DailyRelatedNo_1to21];
xlswrite('DailyRelatedNo_7to1to21',DailyRelatedNo_7to1to21);
