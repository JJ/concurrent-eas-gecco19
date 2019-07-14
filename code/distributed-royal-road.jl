#!/usr/bin/env julia

using Distributed

push!(LOAD_PATH, pwd() )

global iterations = 100000
global top_length = 32768

# Create a random chromosome
function random_chromosome(length)

    chromosome = Bool[]

    for i in 1:1:length
        if ( rand(0:1) > 0.5 )
      	    push!(chromosome,true)
        else
	    push!(chromosome,false)
        end
    end
    chromosome
end

# Mutate and compute time
function time_mutations(number,len)
  inicioTiempo = time()

  for i in 0:1:number
      indi = random_chromosome(len)
      rr = @distributed (+) for j in [indi[n:n+3] for n=1:3:length(indi)-3]
          value = reduce(+, j )
          if value == 0 || value == 4
              1
          else
              0
          end
      end
  end
  time()-inicioTiempo

end

function run_royalroad()
    len = 16
    while len <= top_length
        println("julia-RoyalRoad-d4, " * string(len) * ", " * string(time_mutations( iterations,len )))
        len *= 2
    end
end

run_royalroad()
