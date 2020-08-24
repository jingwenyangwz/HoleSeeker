function [E] = crop_and_close(I)
    offset = calc_offset(I);
    y = offset(1);
    x = offset(2);
    E = I(y:y+99,x:x+99);
    disk = strel('disk',1);
    E = imdilate(E,disk);
    E = imerode(E,disk);
    
    
    
end