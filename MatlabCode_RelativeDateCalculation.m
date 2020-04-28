%calculate the relative date of each tweet according to its absolute date
clear all;
load("filepath");%load the "dataser_7to1" that has been completed the text striping (into singlewords).
load("filepath");%load the "dataser_1to21" that has been completed the text striping (into singlewords).
load("filepath");%load the starting date file of 1278 users (namely, relatie date is 1). file name is "user1278_QuarantineStartingDate"

for i=1:length(dataser_7to1);
    subtime=dataser_7to1(1,2);
    subname=dataser_7to1(i,1);
    subtime=datetime(subtime,'InputFormat','yyyy-MM-dd');
    loc=ismember(user1278_QuarantineStartingDate(2:end,1),subname);
    k=find(loc);
    substartingtime=datetime(user1278_QuarantineStartingDate(k(1),2),'InputFormat','yyyy-MM-dd');
    dayX=datenum(subtime)-datenum(substartingtime);
    dayX=ceil(abs(dayX));% include 1st day
    if dayX==0;
        user1278_nametimedaywords_7to1(i,4)=string(1);
    else user1278_nametimedaywords_7to1(i,4)=string(dayX);
    end
end

for i=1:length(dataser_1to21);
    subtime=dataser_1to21(1,2);
    subname=dataser_1to21(i,1);
    subtime=datetime(subtime,'InputFormat','yyyy-MM-dd');
    loc=ismember(user1278_QuarantineStartingDate(2:end,1),subname);
    k=find(loc);
    substartingtime=datetime(user1278_QuarantineStartingDate(k(1),2),'InputFormat','yyyy-MM-dd');
    dayX=datenum(subtime)-datenum(substartingtime);
    dayX=ceil(abs(dayX));% include 1st day
    if dayX==0;
        user1278_nametimedaywords_1to21(i,4)=string(1);
    else user1278_nametimedaywords_1to21(i,4)=string(dayX);
    end
end
