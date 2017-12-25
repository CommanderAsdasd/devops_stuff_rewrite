zfspool = 'data'

def get_snapshots_list(args=None):
    path_to_snapshots = '/' + zfspool + '/' + args.blockchain + '/.zfs/snapshot/'
    listdir = [d for d in os.listdir(path_to_snapshots) if os.path.isdir(os.path.join(path_to_snapshots, d))]
    snapshot_list = []
    for d in listdir:
        hight = d.split('hight')[1]
        if is_int(hight):
            h = int(hight)
            snapshot_list.append([d.split('night')[0], h])
    return snapshot_list

def main(argv=None):
    args = ParseCommandLine()
    snapshot_list = get_snapshots_list(args)
    ccunrpc_port = get_ccunrpc_port(args)
    last_h = 0
    for h in snapshot_list:
        if h[1] > last_h:
            last_h = h[1]
    cur_h = get_cur_height(ccunrpc_port)
    if cur_h - last_h < 1
        exit()
    daemon_freeze(args, ccunrpc_port)
    new_snapshot = take_snapshot(args, cur_h)
    # replace_link_for_last_snapshot()

    daemon_unfreeze(args, ccunrpc_port)
    snapshot_list = get_snapshots_list(args)
    remove_snapshots(args, snapshot_list)

if __name__ == "__main__":
    sys.exit(main())