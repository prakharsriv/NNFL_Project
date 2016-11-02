function x = fitnessFunction(alpha,fcm)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%decimal alpha

alphax1=bin2dec(alpha(1,:))/1024;
alphay1=bin2dec(alpha(2,:))/1024;
alphax2=bin2dec(alpha(3,:))/1024;
alphay2=bin2dec(alpha(4,:))/1024;
alphax3=bin2dec(alpha(5,:))/1024;
alphay3=bin2dec(alpha(6,:))/1024;
%min and max x and y values in given fcm data
xmin=min(fcm(:,1));
ymin=min(fcm(:,2));
xmax=max(fcm(:,1));
ymax=max(fcm(:,2));

%centroid1
x1=xmin+(alphax1*(xmax-xmin));
y1=ymin+(alphay1*(ymax-ymin));

%centroid2
x2=xmin+(alphax2*(xmax-xmin));
y2=ymin+(alphay2*(ymax-ymin));

%centroid3
x3=xmin+(alphax3*(xmax-xmin));
y3=ymin+(alphay3*(ymax-ymin));

%distance array
[M N]=size(fcm);
d=[];
%d(1,:)
for i=1:M
    pos=[x1 y1,fcm(i,:)]
    d(1,i)=pdist(pos,'euclidean');
end
%d(2,:)
for i=1:M
    pos=[x2 y2,fcm(i,:)]
    d(2,i)=pdist(pos,'euclidean');
end

%d(3,:)
for i=1:M
    pos=[x3 y3,fcm(i,:)]
    d(3,i)=pdist(pos,'euclidean');
end

%membership function
u=[]
for i=1:3
    for j=1:M
        u(i,j)=(d(i,j)^-2)/((d(1,j)^-2)+(d(2,j)^-2)+(d(3,j)^-2))
    end
end

%new cenroids
x1new=((u(1,:).^2)*fcm(:,1))/(sum(u(1,:).^2));
x2new=((u(2,:).^2)*fcm(:,1))/(sum(u(2,:).^2));
x3new=((u(3,:).^2)*fcm(:,1))/(sum(u(3,:).^2));
y1new=((u(1,:).^2)*fcm(:,2))/(sum(u(1,:).^2));
y2new=((u(2,:).^2)*fcm(:,2))/(sum(u(2,:).^2));
y3new=((u(3,:).^2)*fcm(:,2))/(sum(u(3,:).^2));

%summation of change in distance
dnew=[]
pos=[x1 y1,x1new y1new]
dnew(1)=pdist(pos,'euclidean');

pos=[x2 y2,x2new y2new]
dnew(2)=pdist(pos,'euclidean');

pos=[x3 y3,x3new y3new]
dnew(3)=pdist(pos,'euclidean');

x=sum(dnew);
end

