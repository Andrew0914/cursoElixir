defmodule ReadFile do

    def send_repeated(linea) do
        repeated_words = %{}
        Enum.map(String.split(linea , [" " , "." , ","]) , 
            fn palabra -> 
                repeated_words = Map.update(repeated_words , palabra , 1 , fn x -> x + 1 end)
            end)
     
        send(self() , {:calc , {"PID : #{inspect(self())}" , repeated_words} })
    end

    def read_file(file) do
        {_, contenido}  = File.read file
        Enum.each(String.split(contenido , "\n") , 
            fn linea -> 
                spawn ( fn ->   send_repeated(linea) end)
            end)
    end

end

ReadFile.read_file "lorem_ipsum_10.txt"
