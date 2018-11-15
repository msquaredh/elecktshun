var Elecktshun = artifacts.require("./Elecktshun.sol");
contract("Elecktshun", function(accounts){
    var elecktshunInstance;
    // Test the initial number of candidates is correct
    it("initializes with 2 candidates", function(){
        return Elecktshun.deployed().then(function(instance) {
            return instance.candidateCount();
        }).then(function(count) {
            assert.equal(count, 2);
        });
    });
    // Test that the values for each candidate are initialized correctly
    it("initializes the candidates with the correct values", function() {
        return Elecktshun.deployed().then(function(instance){
            elecktshunInstance = instance;
            return elecktshunInstance.candidates(1);
        }).then(function(candidate){
            assert.equal(candidate[0], 1, "id is correct");
            assert.equal(candidate[1], 'Mardoggy', "name is correct");
            assert.equal(candidate[2], 0, "initial vote count is 0");
            return elecktshunInstance.candidates(2);
        }).then(function(candidate){
            assert.equal(candidate[0], 2, "id is correct");
            assert.equal(candidate[1], 'Heebs', "name is correct");
            assert.equal(candidate[2], 0, "initial vote count is 0");
        });
    });
});
