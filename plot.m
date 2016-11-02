function plot(alpha,fcm)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%decimal alpha

alphax1=bi2de(alpha(1,:))/1024;
alphay1=bi2de(alpha(2,:))/1024;
alphax2=bi2de(alpha(3,:))/1024;
alphay2=bi2de(alpha(4,:))/1024;
alphax3=bi2de(alpha(5,:))/1024;
alphay3=bi2de(alpha(6,:))/1024;
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

indexValue=[]
for j=1:M
    [membershipvalue,clusterno] = max(u(:,j))
    indexValue(j,1) = membershipvalue;
    indexValue(j,2) = clusterno;
end

plot(fcm(:,1),fcm(:,2),indexValue(:,1))
cluster1=find(indexValue(:,2)==1)
cluster2=find(indexValue(:,2)==2)
cluster3=find(indexValue(:,2)==3)
figure
plot(fcm(cluster1,1),fcm(cluster1,2),'b')
hold on
plot(fcm(cluster2,1),fcm(cluster2,2),'r')
hold on
plot(fcm(cluster3,1),fcm(cluster3,2),'g')
hold off
end

