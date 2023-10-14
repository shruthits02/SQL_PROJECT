----calculating amount with tax if case if amount less than 5 means 10% if more than 5 means 13%.----
select payment_id,customer_id,staff_id,rental_id,amount, case
when amount < 5 then round(amount+(amount*10)/100,2)
else round(amount+(amount*13)/100,2)
end as selling_price, payment_date
from payment
limit 100