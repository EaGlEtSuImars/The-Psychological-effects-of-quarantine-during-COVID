%construct each user's twitter homepage link
clear all;
username=importdata(the file path of 1278 user names);
userhomepagelink=[];
for i=1:length(username);
    sub=username(i);
    link=insertBefore(sub,sub(1),'https://twitter.com/');
    userhomepagelink=[userhomepagelink;link];
end
%output homepage link to a text file
fid=fopen('userhomepagelink','wt');
for i=1:length(userhomepagelink);
    fprintf(fid,'%s\n',userhomepagelink(i));
end

% following step is input the text file into another software
% "Houyicaijiqi" to scraped each user's nationality information, more
% details in "http://www.houyicaiji.com/?type=post&pid=4630"