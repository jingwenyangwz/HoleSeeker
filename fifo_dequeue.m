function [FIFO, item] = fifo_dequeue(FIFO)
    len = size(FIFO,2);

    if isempty(FIFO) 
       FIFO = [];
       item = [];
    else
       item = FIFO{1};
       for i = 2:len
           FIFO{i-1}=FIFO{i};
       end
       FIFO = FIFO(1:end-1);
       
    end
end