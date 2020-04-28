clear all;
%input the all collected data using a struct
rawdata=dir(fullfile(filefolderpath));
rawdata=rawdata(3:end);
%input the name list of 1278 qualified users
username=importdata(filefolderpath);
%extract the name, time and text of all data
user_nametimetext={};
for n=1:length(rawdata)
    subname=rawdata(n).name;
    subfolder=rawdata(n).folder;
    subfilename=fullfile(subfolder,subname);% construct a file path
    jsonData=jsondecode(fileread(subfilename));%load json file
    subuser_nametimetext=[{jsonData.usernameTweet},{jsonData.datetime},{jsonData.text}];
    user_nametimetext=[user_nametimetext;subuser_nametimetext];
end
%start to cleanse
cleansed_data=[];
for i=1:length(username);
    subusername=username(i);
    Lia=ismember(user_nametimetetx(:,1),subusername);
    k=find(Lia);
    subuser_nametimetetx=user_nametimetetx(k,:);
    cleansed_data=[cleansed_data;subuser_nametimetetx];
end
%re-name and save the cleansed data
newfilename=cleansed_data;
save('newfilename.mat','newfilename');
