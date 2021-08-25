%Maxpool over a window of K*K.
%The kernel size K and stride S are integers.
%Pool the input (bottom) with windows of size K and with the specified stride.
%No padding needed.
function [ pool_out ] =maxpool_layer(pool_input,kernel_size,stride_size)
    [Win,Hin,N]=size(pool_input);
    Wout = (Win-kernel_size)/stride_size+1;
    Hout = (Hin-kernel_size)/stride_size+1;
    
    Wout=floor(Wout);
    Hout=floor(Hout);
    
    pool_out=zeros(Wout,Hout,N);
    for n=1:N
        for h=1:Hout
            for w=1:Wout
                hstart = (h-1)*stride_size+1;
                wstart = (w-1)*stride_size+1;
                hend=hstart+kernel_size-1;
                wend=wstart+kernel_size-1;
                pool_out(w,h,n)=max(max(pool_input(wstart:wend,hstart:hend,n)));
            end
        end
    end
end
