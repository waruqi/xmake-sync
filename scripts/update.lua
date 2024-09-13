import("core.base.option")

function main()
    local updateinfo = io.load(path.join(os.scriptdir(), "..", "update.txt"))
    local repo = updateinfo.repo
    local name = path.basename(repo)
    print("update %s ..", repo)
    os.exec("git clone git@github.com:%s.git -b dev --recurse-submodules %s", repo, name)
    os.cd(name)
    os.exec("git push git@gitlab.com:%s.git dev", (repo:gsub("xmake%-io/", "tboox/")))
    os.exec("git push git@gitee.com:%s.git dev", (repo:gsub("xmake%-io/", "tboox/")))
    --os.exec("git push git@gitcode.com:%s.git dev", repo)
    os.exec("git checkout master")
    os.exec("git merge dev")
    os.exec("git push git@github.com:%s.git master", repo)
    os.exec("git push git@gitlab.com:%s.git master", (repo:gsub("xmake%-io/", "tboox/")))
    os.exec("git push git@gitee.com:%s.git master", (repo:gsub("xmake%-io/", "tboox/")))
    --os.exec("git push git@gitcode.com:%s.git master", repo)
end
