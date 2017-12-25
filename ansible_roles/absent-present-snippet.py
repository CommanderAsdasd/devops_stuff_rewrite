"""Present устанавливает, absent удаляет"""
if state in ['installed', 'present']:
    if disable_gpg_check:
        yum_basecmd.append('--nogpgcheck')
    res = install(module, pkgs, repoq, yum_basecmd, conf_file, en_repos, dis_repos)
elif state in ['removed', "absent"]:
    res = remove(module, pkgs, repoq, yum_basecmd, conf_file, en_repos, dis_repos)
elif state == 'latest':
    if disable_gpg_check