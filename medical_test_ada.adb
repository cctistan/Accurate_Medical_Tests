with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;

-- Cole Tistan, Denisha Pimentel, Kyle Kaminski

procedure Medical_Test is

   Num_Patients: Integer;
   Patient_Num, HasDisease, FirstTest, SecondTest: Integer;

   Disease_First_Test, Disease_Second_Test, Positive_One, Positive_Two,
   Healthy_First_Test, Healthy_Second_Test, Negative_One, Negative_Two: Float := 0.0;
begin

   Get(Num_Patients);
   for Patient in 1..Num_Patients loop

      Get(Patient_Num);
      Get(HasDisease);
      Get(FirstTest);
      Get(SecondTest);

      -- Probability of Disease and First Test Positive

      if HasDisease = 1 and
         FirstTest = 1 then
         Disease_First_Test := Disease_First_Test + 1.0;
      end if;

      if FirstTest = 1 then
         Positive_One := Positive_One + 1.0;
      end if;

      -- Probability of Disease and Second Test Positive

      if HasDisease = 1 and
         SecondTest = 1 then
         Disease_Second_Test := Disease_Second_Test + 1.0;
      end if;

      if SecondTest = 1 then
         Positive_Two := Positive_Two + 1.0;
      end if;

      -- Probability of Healthy and First Test Negative

      if HasDisease = 0 and
         FirstTest = 0 then
         Healthy_First_Test := Healthy_First_Test + 1.0;
      end if;

      if FirstTest = 0 then
         Negative_ONe := Negative_One + 1.0;
      end if;

      -- Probability of Healthy and Second Test Negative

      if HasDisease = 0 and
         SecondTest = 0 Then
         Healthy_Second_Test := Healthy_Second_Test + 1.0;
      end if;

      if SecondTest = 0 then
         Negative_Two := Negative_Two + 1.0;
      end if;

      case Patient

   end loop;

   -- Calculates and outputs probability results calculated

         Put("P(D | PosOne) = ");
         Put(Disease_First_Test / Positive_One, Fore => 0, Aft => 2, Exp => 0);
         Put_Line("");
         Put("P(D | PosTwo) = ");
         Put(Disease_Second_Test / Positive_Two, Fore => 0, Aft => 2, Exp => 0);
         Put_Line("");
         Put("P(H | NegOne) = ");
         Put(Healthy_First_Test / Negative_One, Fore => 0, Aft => 2, Exp => 0);
         Put_Line("");
         Put("P(H | NegTwo) = ");
         Put(Healthy_Second_Test / Negative_Two, Fore => 0, Aft => 2, Exp => 0);
         Put_Line("");

   -- Checks which tests are the best results

   if Disease_First_Test / Positive_One > Disease_Second_Test / Positive_Two and
      Healthy_First_Test / Negative_One > Healthy_Second_Test / Negative_Two then
      Put_Line("Test 1 is better");

   elsif Disease_First_Test / Positive_One < Disease_Second_Test / Positive_Two and
         Healthy_First_Test / Negative_One < Healthy_Second_Test / Negative_Two then
         Put_Line("Test 2 is better");

   else
      Put_Line("Neither test is better");
   end if;

end Medical_Test;
