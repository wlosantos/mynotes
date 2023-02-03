class Priority < EnumerateIt::Base
  associate_values(
    :low,
    :medium,
    :high
  )
end
