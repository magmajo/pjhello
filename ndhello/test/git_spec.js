/**
 * Created by magma2011 on 2015-01-21.
 */

describe('nodegit 저장소', function() {
    var nodegit = require("nodegit");

    it('열어서 커밋 찾아보기', function(done) {
        nodegit.Repo.open("git/nodegit", function(err, repo) {
            if (err) {
                return done(err);
            }
            expect(repo.path()).toMatch(/\.git\/$/);

            var sha = "e9ec116a8fb2ea051a4c2d46cba637b3fba30575";
            repo.getCommit(sha, function(err, entry) {
                if (err) {
                    return done(err);
                }
                expect(entry.sha()).toEqual(sha);
            });
        });

        done();
    });
});