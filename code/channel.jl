
n = 32
c1 = Channel(n)

for _ in 1:n
    put!(c1,"foo")
end

for _ in 1:n
    data = take!(c1)
    println(data)
end

