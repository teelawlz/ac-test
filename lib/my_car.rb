class MyCar

  MAKE = 'mazda'
  MODEL = '3'
  YEAR = '2014'

  # In interest of saving precious calls per day, taking what I need into a
  # separate class file, basically functioning as an info pillar. Will verify
  # response body's contents against this array of styles my car comes in.
  def self.styles
    [
      "s Grand Touring 4dr Sedan (2.5L 4cyl 6A)",
      "i Grand Touring 4dr Sedan (2.0L 4cyl 6M)",
      "s Touring 4dr Sedan (2.5L 4cyl 6A)",
      "s Grand Touring 4dr Hatchback (2.5L 4cyl 6A)",
      "i Grand Touring 4dr Hatchback (2.0L 4cyl 6M)",
      "i Sport 4dr Hatchback (2.0L 4cyl 6A)",
      "i SV 4dr Sedan (2.0L 4cyl 6M)",
      "i Sport 4dr Sedan (2.0L 4cyl 6A)",
      "i SV 4dr Sedan (2.0L 4cyl 6A)",
      "i Touring 4dr Sedan (2.0L 4cyl 6A)",
      "i Touring 4dr Hatchback (2.0L 4cyl 6M)",
      "i Touring 4dr Hatchback (2.0L 4cyl 6A)",
      "i Sport 4dr Sedan (2.0L 4cyl 6M)",
      "i Sport 4dr Hatchback (2.0L 4cyl 6M)",
      "i Grand Touring 4dr Sedan (2.0L 4cyl 6A)",
      "i Grand Touring 4dr Hatchback (2.0L 4cyl 6A)",
      "s Touring 4dr Hatchback (2.5L 4cyl 6A)",
      "i Touring 4dr Sedan (2.0L 4cyl 6M)"
    ]
  end
end
