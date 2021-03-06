
function [ClusterIm, CCIm] = MyKMeans8(Image, ImageType, NumClusts)
    [m, n, colors] = size(Image);
    if(strcmp('RGB',ImageType)==1)
        R = data(:,:,1);
        G = data(:,:,2);
        B = data(:,:,3);
        R = double(R);
        G = double(G);
        B = double(B);
        R = R(:);
        G = G(:);
        B = B(:);
        data = [R,G,B];
    end
    if(strcmp('Hyper',ImageType)==1)
        b = 20;
        [Y, U, Lambda, Mu] = PCAbyDG(data,b);
        data = Y;
    end
    [IDX, C] = kmeans(data, NumClusts);
    ClusterIm = IDX;
    CCIm = ConnectedComponent(IDX,NumClusts,m,n);
    imagesc(CCIm);
end