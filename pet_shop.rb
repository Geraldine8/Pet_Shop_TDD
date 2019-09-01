#1
def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

#2
def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end
#3 & 4

def add_or_remove_cash(pet_shop, add_cash)
  pet_shop[:admin][:total_cash] += add_cash
end

#5
def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

#6
def increase_pets_sold(pet_shop, pet_sold)
  pet_shop[:admin][:pets_sold] += pet_sold
end

#7
def stock_count(pet_shop)
  pet_shop[:pets].size
end

#8 & 9
def pets_by_breed(pet_shop, breed)
  pets_found = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      pets_found.push(pet)
    end
  end
  return pets_found
end

#10 & 11
def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
      return pet
    end
  end
  return nil
end

#12
def remove_pet_by_name(pet_shop, remove_name)
  for pet in pet_shop[:pets]
    if pet[:name] == remove_name
      pet_shop[:pets].delete(pet)
    end
  end
end

#13
def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

#14
def customer_cash(customer)
  return customer[:cash]
end

#15
def remove_customer_cash(customer, remove_cash)
  customer[:cash] -= remove_cash
end

#16
def customer_pet_count(customer)
  customer[:pets].count
end

#17
def add_pet_to_customer(customer, add_pet)
  customer[:pets].push(add_pet)
end

#======================== Optional =======================================
#1
def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  end
  return false
end

#2 & 3

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet != nil && customer_can_afford_pet(customer, pet)
    add_pet_to_customer(customer, pet)
    increase_pets_sold(pet_shop, 1)
    remove_customer_cash(customer, pet[:price])
    add_or_remove_cash(pet_shop, pet[:price])
  end
end
