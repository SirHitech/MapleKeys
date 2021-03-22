#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

$cdMin := 100
$cdMax := 500

$skillCooldown := Random, $skillCooldown, $cdMin, $cdMax

$*r::
	$stopRepeatSkill := 0
	$lastPress := A_TickCount
	$shift := GetKeyState(LShift)
	Send r
	Loop,
	{
		
		if (A_TickCount - $lastPress > $skillCooldown)
		{
			Send r
			$lastPress := A_TickCount
			Random, $skillCooldown, $cdMin, $cdMax
		}
		
		if ($stopRepeatSkill)
		{
		  return
		}
	}


$*+r::
	$stopRepeatSkill := 0
	$lastPress := A_TickCount
	$shift := GetKeyState(LShift)
	Send R
	Loop,
	{
		
		if (A_TickCount - $lastPress > $skillCooldown)
		{
			Send R
			$lastPress := A_TickCount
			Random, $skillCooldown, $cdMin, $cdMax
		}
		
		if ($stopRepeatSkill)
		{
		  return
		}
	}

$*r up::
	$stopRepeatSkill := 1
	return


f12::
	Suspend
	return