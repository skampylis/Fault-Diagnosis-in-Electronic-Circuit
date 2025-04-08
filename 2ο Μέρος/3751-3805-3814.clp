;+ ���� ������:
;+ ���������� ����������, ���:3751
;+ �������� ������ ��������, ���:3805
;+ ������ ���������, ���:3814

;+ ���������� ����������� (Version & Build) ��� �������:"project.pont" & "project.pins"
;+ ��� ��� 1� ��� �������!
; Mon Dec 12 20:59:20 EST 2022
; 
;+ (version "3.5")
;+ (build "Build 663")

;+ �������� ������ �� ������:"project.pont" ��� ��� 1� ��� �������!

(defclass sensor
	(is-a USER)
	(role abstract)
	(single-slot sensor_input_from
		(type INSTANCE)
;+		(allowed-classes circuit cycle)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot value
		(type INTEGER)
		(range 0 31)
		(default 0)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot SensorName
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass input
	(is-a sensor)
	(role concrete)(pattern-match reactive)
	(single-slot sensor_input_from
		(type INSTANCE)
;+		(allowed-classes cycle)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass mid
	(is-a sensor)
	(role concrete)(pattern-match reactive)
	(single-slot sensor_input_from
		(type INSTANCE)
;+		(allowed-classes circuit)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass output
	(is-a sensor)
	(role concrete)(pattern-match reactive)
	(single-slot sensor_input_from
		(type INSTANCE)
;+		(allowed-classes circuit)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass circuit
	(is-a USER)
	(role abstract)
	(multislot output_to
		(type INSTANCE)
;+		(allowed-classes cycle circuit)
		(create-accessor read-write))
	(single-slot out
		(type INTEGER)
		(range 0 31)
		(default 0)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot CircuitName
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot output_sensor
		(type INSTANCE)
;+		(allowed-classes sensor)
		(cardinality 1 4)
		(create-accessor read-write))
	(single-slot in1
		(type INTEGER)
		(range 0 31)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot in2
		(type INTEGER)
		(range 0 31)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot input_from
		(type INSTANCE)
;+		(allowed-classes circuit cycle)
		(cardinality 1 2)
		(create-accessor read-write)))

(defclass add
	(is-a circuit)
	(role concrete)(pattern-match reactive))

(defclass multiply
	(is-a circuit)
	(role concrete)(pattern-match reactive))

(defclass cycle
	(is-a USER)
	(role concrete)
	(single-slot mid1
		(type INTEGER)
		(range 0 31)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot cycle_id
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot ouput
		(type INTEGER)
		(range 0 31)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot output_to
		(type INSTANCE)
;+		(allowed-classes circuit cycle)
		(create-accessor read-write))
	(single-slot mid3
		(type INTEGER)
		(range 0 31)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot mid2
		(type INTEGER)
		(range 0 31)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot input4
		(type INTEGER)
		(range 0 31)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot input2
		(type INTEGER)
		(range 0 31)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot input3
		(type INTEGER)
		(range 0 31)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot input1
		(type INTEGER)
		(range 0 31)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot output_sensor
		(type INSTANCE)
;+		(allowed-classes sensor)
		(cardinality 1 4)
		(create-accessor read-write))
	(multislot input_from
		(type INSTANCE)
;+		(allowed-classes circuit cycle)
		(cardinality 1 2)
		(create-accessor read-write)))

;+ �������� ������ �� ������:"project.pins" ��� ��� 1� ��� �������!
;+ �������, ������ ������� �� ������� ��� �� Default ��� Protege, ����
;+ ���� �� ����� ��� ����������.

(definstances facts
([mid3] of  mid

	(sensor_input_from [Multiply2])
	(SensorName "m3")
	(value 26))

([mid1] of  mid

	(sensor_input_from [Add1])
	(SensorName "m1")
	(value 10))

([mid2] of  mid

	(sensor_input_from [Multiply1])
	(SensorName "m2")
	(value 24))

([output] of  output

	(sensor_input_from [Add2])
	(SensorName "out")
	(value 18))

([input1] of  input

	(sensor_input_from [Cycle1])
	(SensorName "in1")
	(value 21))

([input2] of  input

	(sensor_input_from [Cycle1])
	(SensorName "in2")
	(value 28))

([input3] of  input

	(sensor_input_from [Cycle1])
	(SensorName "in3")
	(value 10))

([input4] of  input

	(sensor_input_from [Cycle1])
	(SensorName "in4")
	(value 25))

([Cycle1] of  cycle

	(cycle_id 1)
	(input1 21)
	(input2 28)
	(input3 10)
	(input4 25)
	(mid1 10)
	(mid2 24)
	(mid3 26)
	(ouput 18)

	(output_sensor
		[mid1]
		[mid2]
		[mid2]
		[output])
	(output_to
		[Add1])
		)

([Cycle2] of  cycle

	(cycle_id 2)
	(input1 7)
	(input2 25)
	(input3 13)
	(input4 15)
	(mid1 0)
	(mid2 0)
	(mid3 3)
	(ouput 3))

([Cycle3] of  cycle

	(cycle_id 3)
	(input1 11)
	(input2 17)
	(input3 24)
	(input4 31)
	(mid1 22)
	(mid2 6)
	(mid3 8)
	(ouput 14))

([Cycle4] of  cycle

	(cycle_id 4)
	(input1 18)
	(input2 11)
	(input3 28)
	(input4 21)
	(mid1 4)
	(mid2 12)
	(mid3 12)
	(ouput 0))

([Cycle5] of  cycle

	(cycle_id 5)
	(input1 25)
	(input2 24)
	(input3 30)
	(input4 10)
	(mid1 18)
	(mid2 16)
	(mid3 12)
	(ouput 12))

([Cycle6] of  cycle

	(cycle_id 6)
	(input1 12)
	(input2 19)
	(input3 11)
	(input4 19)
	(mid1 8)
	(mid2 24)
	(mid3 17)
	(ouput 9))

([Cycle7] of  cycle

	(cycle_id 7)
	(input1 1)
	(input2 31)
	(input3 7)
	(input4 22)
	(mid1 2)
	(mid2 0)
	(mid3 26)
	(ouput 26))

([Cycle8] of  cycle

	(cycle_id 8)
	(input1 0)
	(input2 31)
	(input3 3)
	(input4 23)
	(mid1 0)
	(mid2 0)
	(mid3 0)
	(ouput 0))

([Cycle9] of  cycle

	(cycle_id 9)
	(input1 31)
	(input2 1)
	(input3 6)
	(input4 8)
	(mid1 30)
	(mid2 30)
	(mid3 0)
	(ouput 30))

([Cycle10] of  cycle

	(cycle_id 10)
	(input1 6)
	(input2 4)
	(input3 25)
	(input4 12)
	(mid1 12)
	(mid2 31)
	(mid3 12)
	(ouput 28))

([Add1] of  add

	(CircuitName "a1")
	(in1 21)
	(in2 21)
	(input_from [Cycle1])
	(out 10)
	(output_sensor [mid1])
	(output_to [Multiply1]))

([Add2] of  add

	(CircuitName "a2")
	(in1 24)
	(in2 26)
	(input_from
		[Multiply1]
		[Multiply2])
	(out 18)
	(output_sensor [output])
	(output_to [Cycle1]))

([Multiply1] of  multiply

	(CircuitName "p1")
	(in1 28)
	(in2 10)
	(input_from
		[Add1]
		[Cycle1])
	(out 24)
	(output_sensor [mid2])
	(output_to [Add2]))

([Multiply2] of  multiply

	(CircuitName "p2")
	(in1 10)
	(in2 25)
	(input_from [Cycle1])
	(out 26)
	(output_sensor [mid3])
	(output_to [Add2])))

;+ �������� �������� ��� ������ �� CLIPS (��� ��� 2� �������!).

;+ �������� ��������� ��������� ��� ��� �������������� ����� ���������������
(defmessage-handler multiply multiply-input primary (?in1 ?in2)
	(mod (* ?in1 ?in2) 32)
)

;+ �������� ��������� ��������� ��� ��� �������� ����� ���������
(defmessage-handler add add-input primary (?in1 ?in2)
	(mod (+ ?in1 ?in2) 32)
)

;+ ���������� ��� ������� ����������, ���� ������� ��� ����� ��� ��� ����������� 
;+ ��� ������ ���� ����� "����������� �����".
(defrule begin
	?x <- (initial-fact)
  =>
  	(retract ?x)
  	(set-strategy mea)
  	(assert (goal bind-values))
	(assert (current-clock 1))
)

;+ ��������, ������� ���� ������� ����� ��������� ��� ���� ��������, �������������� ��� ���������
;+ ��� ������ ����������� �� ������� �������� ��� ���� ��������� ������� ��� �� �� �������������
;+ ���� ���� �������� ������� ���� ���������� (a1, a2, p1, p2) � ���� ���� ������� �������� ����
;+ ��������� (mid1, mid2, mid3, output).��� ������������ �������� ���� ������� ����� ���������
;+ ��� ��� 1� �������� (a1).
(defrule bind-values-to-a1
  (goal bind-values)
  (current-clock ?cycle_id)
  (object (is-a cycle) (input1 ?input1) (cycle_id ?cycle_id))
  (object (is-a circuit) (name ?c) (CircuitName "a1"))
=>
  (modify-instance ?c (in1 ?input1)(in2 ?input1))
)

;+ ������� ����� ��������� ��� ��� 2� �������� (a2).
(defrule bind-values-to-a2
  (goal bind-values)
  (current-clock ?cycle_id)
  (object (is-a cycle) (mid2 ?mid2)(mid3 ?mid3) (cycle_id ?cycle_id))
  (object (is-a circuit) (name ?c) (CircuitName "a2"))
=>
  (modify-instance ?c (in1 ?mid2)(in2 ?mid3))
)

;+ ������� ����� ��������� ��� ��� 1� �������������� (p1).
(defrule bind-values-to-p1
  (goal bind-values)
  (current-clock ?cycle_id)
  (object (is-a cycle) (name ?cy) (input2 ?input2) (mid1 ?mid1) (cycle_id ?cycle_id))
  (object (is-a circuit) (name ?c) (CircuitName "p1"))
=>
  (modify-instance ?c (in1 ?input2)(in2 ?mid1))
)

;+ ������� ����� ��������� ��� ��� 2� �������������� (p2).
(defrule bind-values-to-p2
  (goal bind-values)
  (current-clock ?cycle_id)
  (object (is-a cycle) (name ?cy) (input3 ?input3) (input4 ?input4) (cycle_id ?cycle_id))
  (object (is-a circuit) (name ?c) (CircuitName "p2"))
=>
  (modify-instance ?c (in1 ?input3)(in2 ?input4))
)

;+ ������� ����� ��������� ��� ��� 1� ��������� (mid1).
(defrule bind-value-to-sensor-mid1
	(goal bind-values)
 	(current-clock ?cycle_id)
	(object (is-a cycle) (name ?cy) (mid1 ?mid1) (cycle_id ?cycle_id))
	(object (is-a sensor) (name ?m1) (SensorName "m1"))
  =>
  	(modify-instance ?m1 (value ?mid1))
)

;+ ������� ����� ��������� ��� ��� 2� ��������� (mid2).
(defrule bind-value-to-sensor-mid2
	(goal bind-values)
  	(current-clock ?cycle_id)
	(object (is-a cycle) (name ?cy) (mid2 ?mid2) (cycle_id ?cycle_id))
	(object (is-a sensor) (name ?m2) (SensorName "m2"))
  =>
  	(modify-instance ?m2 (value ?mid2))
)

;+ ������� ����� ��������� ��� ��� 3� ��������� (mid3).
(defrule bind-value-to-sensor-mid3
	(goal bind-values)
  	(current-clock ?cycle_id)
	(object (is-a cycle) (name ?cy) (mid3 ?mid3) (cycle_id ?cycle_id))
	(object (is-a sensor) (name ?m3) (SensorName "m3"))
  =>
  	(modify-instance ?m3 (value ?mid3))
)

;+ ������� ����� ��������� ��� ��� ����� (output).
(defrule bind-value-to-sensor-output
	(goal bind-values)
  	(current-clock ?cycle_id)
	(object (is-a cycle) (name ?cy) (ouput ?ouput) (cycle_id ?cycle_id))
	(object (is-a sensor) (name ?out) (SensorName "out"))
  =>
  	(modify-instance ?out (value ?ouput))
)

;+ ����� ��������� � ���� ��� ����������� �����, ��� ���������� ��� ����������� ��
;+ ��� ����� "����������� ������".
(defrule change-goal-to-calc-output
  ?x <- (goal bind-values)
=>
  (retract ?x)
  (assert (goal calc-output))
)

;+ �� ���� �� ����, ������� ���� ������� ����������� ������ ��� ���� �������� ��� ��������������,
;+ ���� ���� ��� ��� ���� ���������� ��� ����� ��� ����� ���� ��� ��� ���� �� ��������
;+ ���� ��� �������� ��� ����������� ������������ ��������� ���������.
;+ ������������: Adders = add-input & Multiplier = multiply-input.
;+ ������� ����������� ������ ��� ��� ����� ��� 1�� �������� (a1).
(defrule calc-output-a1
  (goal calc-output)
  (object (is-a circuit) 
	   (name ?c) (CircuitName "a1") (in1 ?in1) 
	   (in2 ?in2))
=>
  (modify-instance ?c 
	(out (send ?c 
	  add-input ?in1 ?in2))))

;+ ������� ����������� ������ ��� ��� ����� ��� 2�� �������� (a2).
(defrule calc-output-a2
  (goal calc-output)
  (object (is-a circuit) 
	   (name ?c) (CircuitName "a2") (in1 ?in1) 
	   (in2 ?in2))
=>
  (modify-instance ?c 
	(out (send ?c 
	  add-input ?in1 ?in2))))

;+ ������� ����������� ������ ��� ��� ����� ��� 1�� �������������� (p1).
(defrule calc-output-p1
  (goal calc-output)
  (object (is-a circuit) 
	   (name ?c) (CircuitName "p1") (in1 ?in1) 
	   (in2 ?in2))
=>
  (modify-instance ?c 
	(out (send ?c 
	  multiply-input ?in1 ?in2))))

;+ ������� ����������� ������ ��� ��� ����� ��� 2�� �������������� (p2).
(defrule calc-output-p2
  (goal calc-output)
  (object (is-a circuit) 
	   (name ?c) (CircuitName "p2") (in1 ?in1) 
	   (in2 ?in2))
=>
  (modify-instance ?c 
	(out (send ?c 
	  multiply-input ?in1 ?in2))))	

;+ ���� ������������ ��� ����� ���� �����������, ������� ���� ������� ����, � �����
;+ ����� "������ ����������". �� ���� �� ����, ����������� �� ������ ���� ��������
;+ �������������, �� ���� �� ����� ��� ���������� ��� �� �������� ���� �� ��� ������������
;+ ���� ��� ������������� ������.
(defrule change-goal-to-find-discrepancy
  ?x <- (goal calc-output)
=>
  (retract ?x)
  (assert (goal find-discrepancy)))

;+ ��� �� ������ ���� �������� �������������, ��������� ��� ����� ���
;+ �������� �� �� (if), �� ���� �� ������������ ��� ����������. ������������:
;+ 1) ��� ���� ���������� ������� ���������� �� 0:
;+ ���� ���� �������� ��� �� ����������� �������� ������������� (������������!).
;+ 2) ��� ���� ���������� ������� 16 (2^4) �������� ��� ��� ���������� ������������� ����:
;+ ���� ���� �������� ��� �� ����������� �������� ���� �������� �� ��� ��������� bit, ������
;+ �� ��� ��������� bit ����� ����������������!
;+ 3) �� ���� ���� ���������, �� �������� ����� ���� ��������� (������ ���������:������������!)
(defrule find-discrepancy
  (goal find-discrepancy)
  (current-clock ?cycle_id)
  (object (is-a circuit) (name ?c)
		(out ?out)
		(CircuitName ?cn) (output_sensor ?s))
  (object (is-a sensor) (name ?s) (SensorName ?sn)
		(value ?sr&~?out))
=>
  (if (= ?sr 0)
  then (printout t "Time: " ?cycle_id " --> " ?cn " error: Short-circuit!" crlf)(bind ?temp (- ?out 16))(if (= ?sr ?temp)
      then (printout t "Time: " ?cycle_id " --> " ?cn " error: Most Significant Bit is off!" crlf))
  else(bind ?temp (- ?out 16))
      (if (= ?sr ?temp)
      then (printout t "Time: " ?cycle_id " --> " ?cn " error: Most Significant Bit is off!" crlf)
      else(if(not(eq ?s [output])) then (printout t "Time: " ?cycle_id " --> " ?sn " error: Short-circuit!" crlf)))))

;+ ��� ��� �� �������� ��� ���������� �������� ��� ���� ���� �� ��� ���������� �������������
;+ ����, ���� ������ �������� ���������� ����� ���� (�������� ����������!).
(defrule normal_op
  (goal find-discrepancy)
  (current-clock ?cycle_id)
  (object (is-a circuit) (name ?c1)
		(out ?out1)
		(CircuitName "a2") (output_sensor ?s1))
  (object (is-a sensor) (name ?s1) (SensorName "out")
		(value ?out1))
  (object (is-a circuit) (name ?c2)
		(out ?out2)
		(CircuitName "a1") (output_sensor ?s2))
  (object (is-a sensor) (name ?s2) (SensorName "m1")
		(value ?out2))
  (object (is-a circuit) (name ?c3)
		(out ?out3) 
		(CircuitName "p1") (output_sensor ?s3))
  (object (is-a sensor) (name ?s3) (SensorName "m2")
		(value ?out3))
  (object (is-a circuit) (name ?c4) 
		(out ?out4) 
		(CircuitName "p2") (output_sensor ?s4))
  (object (is-a sensor) (name ?s4) (SensorName "m3")
		(value ?out4))
=>
  (printout t "Time: " ?cycle_id " ----> Normal Operation!" crlf))

;+ ����� ����� � ���������� �������, � ������ ���������� �� ������ ����� ��� ��� ������������ ���� �������
;+ ����� ����������� ��� ����������� ��� (�.�. ��� ��� ����� 5 -> ���� ����� 6).
;+ ��� ������� ���� ��� 11 ������, ����������� �� ������������ �� ����� ���.
;+ ���� �������� ���� ������ ��� ���� (��� ����, ������ ������=10), ���� ��������� ����� ���� �������
;+ ��� �� ��������� ��� ���������. �� ������ ��� ������������ �������� ����������� ��� ����� ���� �������, 
;+ ������ ����� ������ ���� ������������� ��� �� ������ ������������� ����.
(defrule new_cycle
  ?x <- (goal find-discrepancy)
  ?clock <-(current-clock ?cycle_id)
=>
      (bind ?temp (+ ?cycle_id 1))
      (retract ?x)
      (retract ?clock)
      (if (> 11 ?temp) then
      	(assert (current-clock ?temp))
      	(assert (goal bind-values)))
)