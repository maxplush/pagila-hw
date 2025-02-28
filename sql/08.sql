/*
 * Use a JOIN to display the first and last names, as well as the address, of each staff member.
 * Use the tables staff and address.
 * Order by last name.
 */

SELECT first_name, last_name, address AS "street_address"
FROM staff
JOIN adress USING (address_id);
