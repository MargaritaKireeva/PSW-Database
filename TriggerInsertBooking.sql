CREATE TRIGGER InsertBooking
ON Bookings
AFTER INSERT --при вставки строки в бронирование
AS
BEGIN
DECLARE @BookingAmount INT, @ItemID INT
SELECT @ItemID = ItemID, @BookingAmount = Amount FROM inserted
UPDATE Items
SET AmountAvailable = AmountAvailable - @BookingAmount -- кол-во доступных товаров уменьшается
WHERE ID = @ItemID
END
