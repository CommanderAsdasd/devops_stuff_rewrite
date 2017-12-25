#get all groups
ansible -i eva_prod sat-nxt.adam.loc -m debug -a 'var=groups.keys()'

