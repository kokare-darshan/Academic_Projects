function edgehist = cannyedgeFeat(imgIn)

rgb_img = imgIn;

gray_img = rgb_img;
[row, col] = size(gray_img);

edge_canny = edge(gray_img,'canny');
figure, imshow(edge_canny), title('Canny Edge Image');

for cir1 = 2:row
    for cir2 = 2:col
        Gx(cir1,cir2) = sum(gray_img(cir1:cir1+1,cir2+1))...
            -sum(gray_img(cir1:cir1+1,cir2))...
            +gray_img(cir1,cir2+1)-gray_img(cir1,cir2);
        Gy(cir1,cir2) = sum(gray_img(cir1+1,cir2:cir2+1))...
            -sum(gray_img(cir1,cir2:cir2+1))...
            +gray_img(cir1+1,cir2)-gray_img(cir1,cir2);
        Gx(cir1,cir2) = Gx(cir1,cir2)+(Gx(cir1,cir2)==0)*1e-6;
        theta(cir1,cir2) = atan(double(Gy(cir1,cir2))/(Gx(cir1,cir2)));
    end
end

%edge_theta = theta&edge_canny;
for cir1 = 1:row
    for cir2 = 1:col
        if edge_canny(cir1,cir2) == 1
            edge_theta(cir1,cir2) = theta(cir1,cir2);
        else
            edge_theta(cir1,cir2) = 0;
        end
    end
end

TH = [tan(pi/16),tan(3*pi/16),tan(5*pi/16),tan(7*pi/16),tan(*pi/16),...
    tan(-3*pi/16),tan(-5*pi/16),Inf;tan(-pi/16),tan(1*pi/16),tan(3*pi/16),...
    tan(5*pi/16),tan(-3*pi/16),tan(-5*pi/16),tan(-7*pi/16),tan(7*pi/16)];

for i = 1:8
        direct_img = ((abs(edge_theta) < TH(1,i)) & (abs(edge_theta) >= TH(2,i)));
    edgehist(i) = sum(sum(direct_img & edge_canny));
end

