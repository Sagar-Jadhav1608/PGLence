export default `
users(id, name, email, created_at)
orders(id, user_id, amount, created_at)

users.id = orders.user_id (foreign key)

users.created_at: Timestamp when user signed up
orders.amount: Amount spent by user in the order
`;