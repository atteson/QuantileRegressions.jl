using QuantileRegressions, Distributions, CSV, DataFrames, Pkg, Plots
dir = Pkg.dir( "QuantileRegressions" )
mycyle = CSV.read(joinpath( dir, "examples", "mcycle.csv" ), DataFrame)
x = mycyle.times
y = mycyle.accel

p = plot(size=[1200,1000])
for t = range(0.01,0.99,length=99)
    res = QuantileRegressions.npqreg(Array(y), Array(x), t; h=2)
    plot!(p, res[1], res[2]; label="tau=$t")
end
display(p)
