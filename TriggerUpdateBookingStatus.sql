CREATE TRIGGER UpdateBookingStatus
ON Bookings
AFTER UPDATE
AS
BEGIN
DECLARE @BookingStatus nvarchar(30), @ItemID INT, @BookingAmount INT
SELECT @ItemID = ItemID, @BookingAmount = Amount, @BookingStatus = BookingStatus FROM inserted
IF (@BookingStatus = 'Забрали') 
   BEGIN
   UPDATE Items 
   SET AmountAll = AmountAll - @BookingAmount 
   WHERE ID = @ItemID
   END
ELSE IF (@BookingStatus = 'Просрочено') 
   BEGIN
   UPDATE Items
   SET AmountAvailable = AmountAvailable + @BookingAmount
   WHERE ID = @ItemID
   END
END
