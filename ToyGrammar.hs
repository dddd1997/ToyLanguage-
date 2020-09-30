{-# OPTIONS_GHC -w #-}
module ToyGrammar where 
import ToyTokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

data HappyAbsSyn t4 t5
	= HappyTerminal (ToyToken)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,230) ([52736,572,64,0,0,0,7807,1,0,0,0,0,0,58992,17,15566,49154,18329,0,2048,0,256,52448,99,31228,28,0,0,2,16384,0,4032,66,16888,8,7935,1,0,39936,1145,13184,143,0,0,32,49152,18329,0,256,0,32,0,0,31132,32772,36671,1793,4096,224,512,57280,71,62264,32776,0,2,0,0,0,0,0,7,16,1,4,0,896,2048,0,64,16,128,31132,32772,34591,32768,129,224,512,39360,71,0,0,40575,4097,16384,0,0,13184,143,59376,16,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Exp","Type","Bool","Int","Unit","arr","int","true","false","'<'","'+'","var","if","then","else","fst","snd","lam","let","':'","'='","in","'('","')'","','","%eof"]
        bit_start = st * 29
        bit_end = (st + 1) * 29
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..28]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (10) = happyShift action_2
action_0 (11) = happyShift action_4
action_0 (12) = happyShift action_5
action_0 (15) = happyShift action_6
action_0 (16) = happyShift action_7
action_0 (19) = happyShift action_8
action_0 (20) = happyShift action_9
action_0 (21) = happyShift action_10
action_0 (22) = happyShift action_11
action_0 (26) = happyShift action_12
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (10) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (10) = happyShift action_2
action_3 (11) = happyShift action_4
action_3 (12) = happyShift action_5
action_3 (13) = happyShift action_21
action_3 (14) = happyShift action_22
action_3 (15) = happyShift action_6
action_3 (16) = happyShift action_7
action_3 (19) = happyShift action_8
action_3 (20) = happyShift action_9
action_3 (21) = happyShift action_10
action_3 (22) = happyShift action_11
action_3 (26) = happyShift action_12
action_3 (29) = happyAccept
action_3 (4) = happyGoto action_20
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_3

action_5 _ = happyReduce_4

action_6 _ = happyReduce_2

action_7 (10) = happyShift action_2
action_7 (11) = happyShift action_4
action_7 (12) = happyShift action_5
action_7 (15) = happyShift action_6
action_7 (16) = happyShift action_7
action_7 (19) = happyShift action_8
action_7 (20) = happyShift action_9
action_7 (21) = happyShift action_10
action_7 (22) = happyShift action_11
action_7 (26) = happyShift action_12
action_7 (4) = happyGoto action_19
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (10) = happyShift action_2
action_8 (11) = happyShift action_4
action_8 (12) = happyShift action_5
action_8 (15) = happyShift action_6
action_8 (16) = happyShift action_7
action_8 (19) = happyShift action_8
action_8 (20) = happyShift action_9
action_8 (21) = happyShift action_10
action_8 (22) = happyShift action_11
action_8 (26) = happyShift action_12
action_8 (4) = happyGoto action_18
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (10) = happyShift action_2
action_9 (11) = happyShift action_4
action_9 (12) = happyShift action_5
action_9 (15) = happyShift action_6
action_9 (16) = happyShift action_7
action_9 (19) = happyShift action_8
action_9 (20) = happyShift action_9
action_9 (21) = happyShift action_10
action_9 (22) = happyShift action_11
action_9 (26) = happyShift action_12
action_9 (4) = happyGoto action_17
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (26) = happyShift action_16
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (26) = happyShift action_15
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (10) = happyShift action_2
action_12 (11) = happyShift action_4
action_12 (12) = happyShift action_5
action_12 (15) = happyShift action_6
action_12 (16) = happyShift action_7
action_12 (19) = happyShift action_8
action_12 (20) = happyShift action_9
action_12 (21) = happyShift action_10
action_12 (22) = happyShift action_11
action_12 (26) = happyShift action_12
action_12 (27) = happyShift action_14
action_12 (4) = happyGoto action_13
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (10) = happyShift action_2
action_13 (11) = happyShift action_4
action_13 (12) = happyShift action_5
action_13 (13) = happyShift action_21
action_13 (14) = happyShift action_22
action_13 (15) = happyShift action_6
action_13 (16) = happyShift action_7
action_13 (19) = happyShift action_8
action_13 (20) = happyShift action_9
action_13 (21) = happyShift action_10
action_13 (22) = happyShift action_11
action_13 (26) = happyShift action_12
action_13 (27) = happyShift action_28
action_13 (28) = happyShift action_29
action_13 (4) = happyGoto action_20
action_13 _ = happyFail (happyExpListPerState 13)

action_14 _ = happyReduce_5

action_15 (15) = happyShift action_27
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (15) = happyShift action_26
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (10) = happyShift action_2
action_17 (11) = happyShift action_4
action_17 (12) = happyShift action_5
action_17 (13) = happyShift action_21
action_17 (14) = happyShift action_22
action_17 (15) = happyShift action_6
action_17 (21) = happyShift action_10
action_17 (26) = happyShift action_12
action_17 (4) = happyGoto action_20
action_17 _ = happyReduce_10

action_18 (10) = happyShift action_2
action_18 (11) = happyShift action_4
action_18 (12) = happyShift action_5
action_18 (13) = happyShift action_21
action_18 (14) = happyShift action_22
action_18 (15) = happyShift action_6
action_18 (21) = happyShift action_10
action_18 (26) = happyShift action_12
action_18 (4) = happyGoto action_20
action_18 _ = happyReduce_9

action_19 (10) = happyShift action_2
action_19 (11) = happyShift action_4
action_19 (12) = happyShift action_5
action_19 (13) = happyShift action_21
action_19 (14) = happyShift action_22
action_19 (15) = happyShift action_6
action_19 (16) = happyShift action_7
action_19 (17) = happyShift action_25
action_19 (19) = happyShift action_8
action_19 (20) = happyShift action_9
action_19 (21) = happyShift action_10
action_19 (22) = happyShift action_11
action_19 (26) = happyShift action_12
action_19 (4) = happyGoto action_20
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (4) = happyGoto action_20
action_20 _ = happyReduce_14

action_21 (10) = happyShift action_2
action_21 (11) = happyShift action_4
action_21 (12) = happyShift action_5
action_21 (15) = happyShift action_6
action_21 (16) = happyShift action_7
action_21 (19) = happyShift action_8
action_21 (20) = happyShift action_9
action_21 (21) = happyShift action_10
action_21 (22) = happyShift action_11
action_21 (26) = happyShift action_12
action_21 (4) = happyGoto action_24
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (10) = happyShift action_2
action_22 (11) = happyShift action_4
action_22 (12) = happyShift action_5
action_22 (15) = happyShift action_6
action_22 (16) = happyShift action_7
action_22 (19) = happyShift action_8
action_22 (20) = happyShift action_9
action_22 (21) = happyShift action_10
action_22 (22) = happyShift action_11
action_22 (26) = happyShift action_12
action_22 (4) = happyGoto action_23
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (4) = happyGoto action_20
action_23 _ = happyReduce_8

action_24 (14) = happyShift action_22
action_24 (4) = happyGoto action_20
action_24 _ = happyReduce_7

action_25 (10) = happyShift action_2
action_25 (11) = happyShift action_4
action_25 (12) = happyShift action_5
action_25 (15) = happyShift action_6
action_25 (16) = happyShift action_7
action_25 (19) = happyShift action_8
action_25 (20) = happyShift action_9
action_25 (21) = happyShift action_10
action_25 (22) = happyShift action_11
action_25 (26) = happyShift action_12
action_25 (4) = happyGoto action_33
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (23) = happyShift action_32
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (23) = happyShift action_31
action_27 _ = happyFail (happyExpListPerState 27)

action_28 _ = happyReduce_15

action_29 (10) = happyShift action_2
action_29 (11) = happyShift action_4
action_29 (12) = happyShift action_5
action_29 (15) = happyShift action_6
action_29 (16) = happyShift action_7
action_29 (19) = happyShift action_8
action_29 (20) = happyShift action_9
action_29 (21) = happyShift action_10
action_29 (22) = happyShift action_11
action_29 (26) = happyShift action_12
action_29 (4) = happyGoto action_30
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (10) = happyShift action_2
action_30 (11) = happyShift action_4
action_30 (12) = happyShift action_5
action_30 (13) = happyShift action_21
action_30 (14) = happyShift action_22
action_30 (15) = happyShift action_6
action_30 (16) = happyShift action_7
action_30 (19) = happyShift action_8
action_30 (20) = happyShift action_9
action_30 (21) = happyShift action_10
action_30 (22) = happyShift action_11
action_30 (26) = happyShift action_12
action_30 (27) = happyShift action_41
action_30 (4) = happyGoto action_20
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (6) = happyShift action_36
action_31 (7) = happyShift action_37
action_31 (8) = happyShift action_38
action_31 (26) = happyShift action_39
action_31 (5) = happyGoto action_40
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (6) = happyShift action_36
action_32 (7) = happyShift action_37
action_32 (8) = happyShift action_38
action_32 (26) = happyShift action_39
action_32 (5) = happyGoto action_35
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (10) = happyShift action_2
action_33 (11) = happyShift action_4
action_33 (12) = happyShift action_5
action_33 (13) = happyShift action_21
action_33 (14) = happyShift action_22
action_33 (15) = happyShift action_6
action_33 (16) = happyShift action_7
action_33 (18) = happyShift action_34
action_33 (19) = happyShift action_8
action_33 (20) = happyShift action_9
action_33 (21) = happyShift action_10
action_33 (22) = happyShift action_11
action_33 (26) = happyShift action_12
action_33 (4) = happyGoto action_20
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (10) = happyShift action_2
action_34 (11) = happyShift action_4
action_34 (12) = happyShift action_5
action_34 (15) = happyShift action_6
action_34 (16) = happyShift action_7
action_34 (19) = happyShift action_8
action_34 (20) = happyShift action_9
action_34 (21) = happyShift action_10
action_34 (22) = happyShift action_11
action_34 (26) = happyShift action_12
action_34 (4) = happyGoto action_46
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (9) = happyShift action_42
action_35 (27) = happyShift action_45
action_35 _ = happyFail (happyExpListPerState 35)

action_36 _ = happyReduce_16

action_37 _ = happyReduce_17

action_38 _ = happyReduce_18

action_39 (6) = happyShift action_36
action_39 (7) = happyShift action_37
action_39 (8) = happyShift action_38
action_39 (26) = happyShift action_39
action_39 (5) = happyGoto action_44
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (9) = happyShift action_42
action_40 (27) = happyShift action_43
action_40 _ = happyFail (happyExpListPerState 40)

action_41 _ = happyReduce_6

action_42 (6) = happyShift action_36
action_42 (7) = happyShift action_37
action_42 (8) = happyShift action_38
action_42 (26) = happyShift action_39
action_42 (5) = happyGoto action_50
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (24) = happyShift action_49
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (9) = happyShift action_42
action_44 (28) = happyShift action_48
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (10) = happyShift action_2
action_45 (11) = happyShift action_4
action_45 (12) = happyShift action_5
action_45 (15) = happyShift action_6
action_45 (16) = happyShift action_7
action_45 (19) = happyShift action_8
action_45 (20) = happyShift action_9
action_45 (21) = happyShift action_10
action_45 (22) = happyShift action_11
action_45 (26) = happyShift action_12
action_45 (4) = happyGoto action_47
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (10) = happyShift action_2
action_46 (11) = happyShift action_4
action_46 (12) = happyShift action_5
action_46 (13) = happyShift action_21
action_46 (14) = happyShift action_22
action_46 (15) = happyShift action_6
action_46 (19) = happyShift action_8
action_46 (20) = happyShift action_9
action_46 (21) = happyShift action_10
action_46 (26) = happyShift action_12
action_46 (4) = happyGoto action_20
action_46 _ = happyReduce_11

action_47 (10) = happyFail []
action_47 (11) = happyFail []
action_47 (12) = happyFail []
action_47 (13) = happyShift action_21
action_47 (14) = happyShift action_22
action_47 (15) = happyFail []
action_47 (21) = happyShift action_10
action_47 (26) = happyFail []
action_47 (4) = happyGoto action_20
action_47 _ = happyReduce_12

action_48 (6) = happyShift action_36
action_48 (7) = happyShift action_37
action_48 (8) = happyShift action_38
action_48 (26) = happyShift action_39
action_48 (5) = happyGoto action_52
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (10) = happyShift action_2
action_49 (11) = happyShift action_4
action_49 (12) = happyShift action_5
action_49 (15) = happyShift action_6
action_49 (16) = happyShift action_7
action_49 (19) = happyShift action_8
action_49 (20) = happyShift action_9
action_49 (21) = happyShift action_10
action_49 (22) = happyShift action_11
action_49 (26) = happyShift action_12
action_49 (4) = happyGoto action_51
action_49 _ = happyFail (happyExpListPerState 49)

action_50 _ = happyReduce_20

action_51 (10) = happyShift action_2
action_51 (11) = happyShift action_4
action_51 (12) = happyShift action_5
action_51 (13) = happyShift action_21
action_51 (14) = happyShift action_22
action_51 (15) = happyShift action_6
action_51 (16) = happyShift action_7
action_51 (19) = happyShift action_8
action_51 (20) = happyShift action_9
action_51 (21) = happyShift action_10
action_51 (22) = happyShift action_11
action_51 (25) = happyShift action_54
action_51 (26) = happyShift action_12
action_51 (4) = happyGoto action_20
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (9) = happyShift action_42
action_52 (27) = happyShift action_53
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_19

action_54 (10) = happyShift action_2
action_54 (11) = happyShift action_4
action_54 (12) = happyShift action_5
action_54 (15) = happyShift action_6
action_54 (16) = happyShift action_7
action_54 (19) = happyShift action_8
action_54 (20) = happyShift action_9
action_54 (21) = happyShift action_10
action_54 (22) = happyShift action_11
action_54 (26) = happyShift action_12
action_54 (4) = happyGoto action_55
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (10) = happyShift action_2
action_55 (11) = happyShift action_4
action_55 (12) = happyShift action_5
action_55 (13) = happyShift action_21
action_55 (14) = happyShift action_22
action_55 (15) = happyShift action_6
action_55 (16) = happyShift action_7
action_55 (19) = happyShift action_8
action_55 (20) = happyShift action_9
action_55 (21) = happyShift action_10
action_55 (26) = happyShift action_12
action_55 (4) = happyGoto action_20
action_55 _ = happyReduce_13

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn4
		 (TmInt happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn4
		 (TmVar happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 _
	 =  HappyAbsSyn4
		 (TmTrue
	)

happyReduce_4 = happySpecReduce_1  4 happyReduction_4
happyReduction_4 _
	 =  HappyAbsSyn4
		 (TmFalse
	)

happyReduce_5 = happySpecReduce_2  4 happyReduction_5
happyReduction_5 _
	_
	 =  HappyAbsSyn4
		 (TmUnit
	)

happyReduce_6 = happyReduce 5 4 happyReduction_6
happyReduction_6 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmPair happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_7 = happySpecReduce_3  4 happyReduction_7
happyReduction_7 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (TmCompare happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  4 happyReduction_8
happyReduction_8 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (TmAdd happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_2  4 happyReduction_9
happyReduction_9 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (TmFst happy_var_2
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  4 happyReduction_10
happyReduction_10 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (TmSnd happy_var_2
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happyReduce 6 4 happyReduction_11
happyReduction_11 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmIf happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 7 4 happyReduction_12
happyReduction_12 ((HappyAbsSyn4  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmLambda happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 10 4 happyReduction_13
happyReduction_13 ((HappyAbsSyn4  happy_var_10) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmLet happy_var_3 happy_var_5 happy_var_8 happy_var_10
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_2  4 happyReduction_14
happyReduction_14 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (TmApp happy_var_1 happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  4 happyReduction_15
happyReduction_15 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  5 happyReduction_16
happyReduction_16 _
	 =  HappyAbsSyn5
		 (TyBool
	)

happyReduce_17 = happySpecReduce_1  5 happyReduction_17
happyReduction_17 _
	 =  HappyAbsSyn5
		 (TyInt
	)

happyReduce_18 = happySpecReduce_1  5 happyReduction_18
happyReduction_18 _
	 =  HappyAbsSyn5
		 (TyUnit
	)

happyReduce_19 = happyReduce 5 5 happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (TyPair happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_20 = happySpecReduce_3  5 happyReduction_20
happyReduction_20 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (TyFun happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 29 29 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenTypeBool _ -> cont 6;
	TokenTypeInt _ -> cont 7;
	TokenTypeUnit _ -> cont 8;
	TokenTypeArr _ -> cont 9;
	TokenInt _ happy_dollar_dollar -> cont 10;
	TokenTrue _ -> cont 11;
	TokenFalse _ -> cont 12;
	TokenLessThan _ -> cont 13;
	TokenPlus _ -> cont 14;
	TokenVar _ happy_dollar_dollar -> cont 15;
	TokenIf _ -> cont 16;
	TokenThen _ -> cont 17;
	TokenElse _ -> cont 18;
	TokenFst _ -> cont 19;
	TokenSnd _ -> cont 20;
	TokenLambda _ -> cont 21;
	TokenLet _ -> cont 22;
	TokenHasType _ -> cont 23;
	TokenEq _ -> cont 24;
	TokenIn _ -> cont 25;
	TokenLParen _ -> cont 26;
	TokenRParen _ -> cont 27;
	TokenComma _ -> cont 28;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 29 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(ToyToken)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parseCalc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [ToyToken] -> a
parseError [] = error "Unknown Parse Error" 
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))

data ToyType = TyInt | TyBool | TyUnit | TyPair ToyType ToyType | TyFun ToyType ToyType
   deriving (Show,Eq)

type Environment = [ (String,Expr) ]

data Expr = TmInt Int | TmTrue | TmFalse | TmUnit | TmCompare Expr Expr 
            | TmPair Expr Expr | TmAdd Expr Expr | TmVar String 
            | TmFst Expr | TmSnd Expr
            | TmIf Expr Expr Expr | TmLet String ToyType Expr Expr
            | TmLambda String ToyType Expr | TmApp Expr Expr 
            | Cl String ToyType Expr Environment
    deriving (Show,Eq)
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
