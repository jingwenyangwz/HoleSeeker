function [HoleVolumes] = process_the_block_of_cheese(cube)
    HoleCount = 0;
    HoleVolumes = [];
    LastVisited = 0;
    FIFO  = cell([],1);
    [y,x,z] = size(cube);
    num = y*x*z;
    
    while 1
        if isempty(FIFO)
        %scanning step
            LastVisited = LastVisited + 1;
            if LastVisited > num
                break;
            end
            [py,px,pz] = ind2sub(size(cube),LastVisited);
            if (cube(py,px,pz) == 1)
                FIFO = fifo_enqueue(FIFO,[py,px,pz]);
                HoleCount = HoleCount +1;
                HoleVolumes(HoleCount) = 0;
            end
            
        else 
        %filling step
            [FIFO,item] = fifo_dequeue(FIFO);
            y = item(1);
            x = item(2);
            z = item(3);

            if cube(y,x,z) == 0
                continue;
            else 
                HoleVolumes(HoleCount) = HoleVolumes(HoleCount) + 1;
                cube(y,x,z) = 0;
               
                %check the neighborhoods
                if (y+1)<=100
                    if cube(y+1,x,z) == 1
                        FIFO = fifo_enqueue(FIFO,[y+1,x,z]);
                    end
                end
                
                if (y-1)>0
                    if cube(y-1,x,z)==1
                        FIFO = fifo_enqueue(FIFO,[y-1,x,z]);
                    end
                end
                
                if (x+1)<=100
                    if cube(y,x+1,z)==1
                        FIFO = fifo_enqueue(FIFO,[y,x+1,z]);
                    end
                end
                
                if (x-1)>0
                    if cube(y,x-1,z)==1                                
                        FIFO = fifo_enqueue(FIFO,[y,x-1,z]);
                    end
                end
                
                if (z+1)<=100
                    if cube(y,x,z+1)==1
                        FIFO = fifo_enqueue(FIFO,[y,x,z+1]);
                    end
                end
                
               if (z-1)>0
                   if cube(y,x,z-1)==1                                
                       FIFO = fifo_enqueue(FIFO,[y,x,z-1]);
                   end
               end
     
            end 
        end
    end
    
end