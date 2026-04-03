
-- MADE BY iwanttokommitdead! please credit if used or modified, thank you!
-- https://gamebanana.com/members/2028555

-- NO GREEN HEART? 

function onCreatePost() 
	-- hides the time bar and the health icons
	setProperty('timeBarBG.visible', false)
	setProperty('timeBar.visible', false)
	setProperty('timeTxt.visible', false)
    setProperty('iconP1.alpha', tonumber(0))
    setProperty('iconP2.alpha', tonumber(0))


end

function onSongStart()
		-- left
	noteTweenX('bfleftx', 4, 500, 1, 'sineInOut');
	noteTweenY('bflefty', 4, 308, 1, 'sineInOut');
	noteTweenDirection('bfleftrotate', 4, 360, 1, 'sineInOut')
    noteTweenAngle('bfleftangle', 4, 360, 1, 'elasticOut')
		-- down
	noteTweenX('bfdownx', 5, 585, 1, 'sineInOut');
	noteTweenY('bfdowny', 5, 398, 1, 'sineInOut');
	noteTweenDirection('bfdownrotate', 5, 270, 1, 'sineInOut')
    noteTweenAngle('bfdownangle', 5, 360, 1, 'elasticOut')
		-- up
	noteTweenX('bfupx', 6, 585, 1, 'sineInOut');
	noteTweenY('bfupy', 6, 228, 1, 'sineInOut');
	noteTweenAngle('bfupangle', 6, 360, 1, 'elasticOut')
		-- right
	noteTweenX('bfrightx', 7, 670, 1, 'sineInOut');
	noteTweenY('bfrighty', 7, 308, 1, 'sineInOut');
	noteTweenDirection('bfrightrotate', 7, 180, 1, 'sineInOut')
    noteTweenAngle('bfrightangle', 7, 360, 1, 'elasticOut')


end

-- BY BEASTLY GHOST, makes the rating thing say something else
function onUpdatePost()
	if ratingFC == '' then -- if the FC is nothing
		setProperty('scoreTxt.text', 'Score: ' .. score .. ' | Hits: ' .. misses .. ' | Determination: 0%')
	 else
		setProperty('scoreTxt.text', 'Score: ' .. score .. ' | Hits: ' .. misses .. ' | Determination: ' ..round(rating * 100, 2).. '% [' ..ratingFC..']')
	end
end

function onUpdate()
	-- side health and score move
	setProperty('scoreTxt.y', 20)
	setProperty('healthBar.angle', 90)
	setProperty('healthBar.x', 930)
	setProperty('healthBar.y', 370)

		-- bye bye dad note
	setPropertyFromGroup('strumLineNotes', 0, 'alpha', 0)
	setPropertyFromGroup('strumLineNotes', 1, 'alpha', 0)
	setPropertyFromGroup('strumLineNotes', 2, 'alpha', 0)
	setPropertyFromGroup('strumLineNotes', 3, 'alpha', 0)
	noteTweenAlpha('dadleft', 0, 0, 0.1, 'linear')
	noteTweenAlpha('daddown', 1, 0, 0.1, 'linear')
	noteTweenAlpha('dadup', 2, 0, 0.1, 'linear')
	noteTweenAlpha('dadright', 3, 0, 0.1, 'linear')

	-- ratings
	-- dunno who this is from but i didnt make it, sorry original creator, never got your name
    if ratingName == '?' then
        setRatingName('...') --When there are no notes
    end
    if ratingName == 'You Suck!' then
        setRatingName('* YOU GET AN "F"!') --From 0% to 19% of accuracy
    end
    if ratingName == 'Shit' then
        setRatingName('* WHAT ARE YOU DOING?') --From 20% to 39% of accuracy
    end
    if ratingName == 'Bad' then
        setRatingName('* ??????????') --From 40% to 49% of accuracy
    end
    if ratingName == 'Bruh' then
        setRatingName('* What.') --From 50% to 59% of accuracy
    end
    if ratingName == 'Meh' then
        setRatingName('* Cmon, human!') --From 60% to 68% of accuracy
    end
    if ratingName == 'Nice' then
        setRatingName('* Hah, nice.') --69% of accuracy :bruh:
    end
    if ratingName == 'Good' then
        setRatingName('* Not bad!') --From 70% to 79% of accuracy
    end
    if ratingName == 'Great' then
        setRatingName('* Youre pretty good, human!') --From 80% to 89% of accuracy
    end
    if ratingName == 'Sick!' then
        setRatingName('* Bring it on!') --From 90% to 99% of accuracy
    end
    if ratingName == 'Perfect!!' then
        setRatingName('* NGAHHH') --100% of accuracy
    end
    if ratingName == '?' and botPlay == true then
        setRatingName('BOTPLAY') --When the botplay is activated
    end
end

function round(x, n)
	-- 	dont touch, this is the math used for the score thing
	n = math.pow(10, n or 0)
	x = x * n
	if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
	return x / n
end

--	 too lazy to do this, and quite frankly not in my priority
-- supposed to make soul flash note colour
--function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
	--if noteType == 1 then
		--doTweenColor('soulleft', 'undynemode', 'ff00e6', 0.2, 'linear')
	--end
--end