income_id = Income.create(yearly income: 19000).id
#creating rental properties
Rental.create(
    address: "130 West 2nd St Rear, Berwick, Pa 18603",
    bedrooms: "0 (STUDIO)",
    bathrooms: "3/4 Bath",
    lease_length: "1 year",
    monthly_rent: "500",
    second_floor: false,
    pets_allowed: true,
    availability: "May 2021",
    income_id: income_id,
    investor_id: Investor.find_or_create_by(name: "Nicholas Oliver").id
)

Rental.create(
    address: "130 West 2nd St Apt. A, Berwick, Pa 18603",
    bedrooms: "2 Bedrooms",
    bathrooms: "1 Bath",
    lease_length: "month-to-month",
    monthly_rent: "500",
    second_floor: true,
    pets_allowed: false,
    availability: "auto-renewed",
    income_id: income_id,
    investor_id: Investor.find_or_create_by(name: "Nicholas Oliver").id

Rental.create(
    address: "130 West 2nd St. Berwick, Pa 18603",
    bedrooms: "n/a - This is a commercial space",
    bathrooms: "2 Commercial Baths",
    lease_length: "1 year",
    monthly_rent: "600",
    second_floor: false,
    pets_allowed: false,
    availability: "February 2022",
    income_id: income_id,
    investor_id: Investor.find_or_create_by(name: "Nicholas Oliver").id
)
