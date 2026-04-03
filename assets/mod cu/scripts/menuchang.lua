-- Lista dos backgrounds (nomes dos arquivos na pasta mods/images)
local backgrounds = {'tr', 'henriqueower', 'tales', 'blood'}
local currentBg = 0

-- Cria ou troca fundo
function changeMenuBackground()
    local newBg
    repeat
        newBg = math.random(#backgrounds)
    until newBg ~= currentBg
    currentBg = newBg

    -- Se já existe, fade out
    if getProperty('menuBgSprite') ~= nil then
        doTweenAlpha('fadeOutBG', 'menuBgSprite', 0, 0.5, 'linear')
        runTimer('removeOldBG', 0.5)
    else
        createNewBG()
    end
end

-- Timer para remover fundo antigo
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'removeOldBG' then
        removeLuaSprite('menuBgSprite', true)
        createNewBG()
    end
end

-- Cria novo fundo atrás dos botões
function createNewBG()
    makeLuaSprite('menuBgSprite', backgrounds[currentBg], 0, 0)
    setObjectCamera('menuBgSprite', 'camGame') -- Fica atrás dos elementos do menu
    setProperty('menuBgSprite.alpha', 0)
    addLuaSprite('menuBgSprite', false)
    doTweenAlpha('fadeInBG', 'menuBgSprite', 1, 0.5, 'linear')
end

-- Chama quando entra no menu de gameplay (antes de iniciar música)
function onCreatePost()
    changeMenuBackground()
end
