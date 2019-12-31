def find_item_by_name_in_collection(name, collection)
# pp collection
  i = 0
  while i < collection.length
    if collection[i][:item] == name
      return collection[i]
    end
    i += 1
  end
end

def consolidate_cart(cart)
  new_cart = []
  i = 0
  while i < cart.length
    new_item = find_item_by_name_in_collection(cart[i][:item], new_cart)
    if new_item != nil
      new_item[:count] += 1
    else
      new_item = {
        :item => cart[i][:item],
        :price => cart[i][:price],
        :clearance => cart[i][:clearance],
        :count => 1
      }
      new_cart << new_item
    end
    i += 1
  end
  new_cart
end

def apply_coupons(cart, coupons)
  i = 0
  while i < coupons.length
    new_item = find_item_by_name_in_collection(coupons[i][:item], cart)
    coupon_item = "#{coupon[i][:item]} W/COUPON"
    new_item_coupon = find_item_by_name_in_collection(coupon_item, cart)
    if new_item && new_item[:count] >= coupons[i][:num]
      if new_item_coupon
        new_item_coupon[:count] += coupons[i][:num]
        new_item -= coupons[i][:num]
      else
        new_item_coupon = {
          :item => coupon_item,
          :price => coupons[i][:price] / coupons[i][:count],
          :clearance => new_item[:clearance],
          :count => coupons[i][:count]
        }
      cart << new_item_coupon
      new_item[:count] -= coupons[i][:num]
      end
    end
    i += 0
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
