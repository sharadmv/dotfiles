# Defined in - @ line 1
function pri --description 'alias pri=pipenv run ipython -i --no-confirm-exit'
	pipenv run ipython -i --no-confirm-exit $argv;
end
