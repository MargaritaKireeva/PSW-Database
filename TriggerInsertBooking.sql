CREATE TRIGGER InsertBooking
ON Bookings
AFTER INSERT 
AS
BEGIN
DECLARE @BookingAmount INT, @ItemID INT
SELECT @ItemID = ItemID, @BookingAmount = Amount FROM inserted
UPDATE Items
SET AmountAvailable = AmountAvailable - @BookingAmount 
WHERE ID = @ItemID
END
