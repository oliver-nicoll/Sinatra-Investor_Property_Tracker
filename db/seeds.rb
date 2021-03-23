
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
    created_at: 03/01/2021, 
    updated_at: 03/23/2021,
    user_id: User.find_or_create_by(email: "oliverrebuild@gmail.com").id

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
    created_at: 03/01/2021,
    updated_at: 03/23/2021,
    user_id: User.find_or_create_by(email: "oliverrebuild@gmail.com").id
)

Rental.create(
    address: "130 West 2nd St. Berwick, Pa 18603",
    bedrooms: "n/a - This is a commercial space",
    bathrooms: "2 Commercial Baths",
    lease_length: "1 year",
    monthly_rent: "600",
    second_floor: false,
    pets_allowed: false,
    availability: "February 2022",
    created_at: 03/01/2021, 
    updated_at: 03/23/2021,
    user_id: User.find_or_create_by(email: "oliverrebuild@gmail.com").id
)
