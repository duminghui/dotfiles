function fnm-state-cleanup
    set -l dir ~/.local/state/fnm_multishells
    set -l reg ~/.local/state/fnm_multishells_live
    set -l in_use
    # 登记文件：pid 活着 → 采信其 multishell 路径；pid 死了 → 登记文件一并清掉
    for f in $reg/*
        test -e $f; or continue
        if ps -p (basename $f) >/dev/null 2>&1
            set -a in_use (cat $f)
        else
            rm -fv $f
        end
    end
    # 链接目录：不在在用集合中的就是残留
    for link in $dir/*
        test -e $link; or continue
        contains $link $in_use; and continue
        rm -v $link
    end
end
