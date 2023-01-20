pragma solidity >=0.4.22 <0.7.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";

contract Body_Examine is ERC721 {
    mapping(uint256 => tests) patienttests;
    mapping(uint256 => scan) scantests;
    mapping(uint256 => system) systemexamine;
    mapping(uint256 => prev) prevdates;
    mapping(uint256 => patient) patientlist;

    struct patient {
        uint256 patient_id;
    }
    patient p;
    struct prev {
        uint256 patient_id;
        string previous;
    }
    prev pr;

    struct tests {
        uint256 patient_id;
        string blood_test;
        string urine_test;
        string ecg;
        string mri_scan;
        string ct_scan;
        string xray;
        string lab_test;
    }
    tests t;
    struct scan {
        uint256 patient_id;
        string built;
        string nouirishment;
        string eyes;
        string tongue;
        uint64 pulse;
        uint64 temp;
        string blood_pressure;
        uint64 respiratory_rate;
    }
    scan s;
    struct system {
        uint256 patient_id;
        string cns;
        string cvs;
        string rs;
        string abdomen;
    }
    system sys;

    address owner;

    constructor() public ERC721("MedicalCoin", "MEDC") {
        owner = 0x34d8bC94989BbE14BCfd98E0550201ba4970B776;
    }

    modifier isOwner() {
        require(msg.sender == owner, "Access is not allowed");

        _;
    }

    function namedecl() public view returns (string memory) {
        return name();
    }

    function symboldecl() public view returns (string memory) {
        return symbol();
    }

    function totalSupplycount() public view returns (uint256) {
        return totalSupply();
    }

    function medical_record(uint256 patient_id) public {
        _mint(msg.sender, patient_id);

        patientlist[patient_id] = p;
    }

    /**
     
     * @param patient_id 
     * @param _previous 
     */
    function previous_dates(uint256 patient_id, string memory _previous)
        public
        isOwner
    {
        pr.previous = _previous;

        prevdates[patient_id] = pr;
    }

    /**
     
     * @param patient_id 
     * */
    function get_previous_dates(uint256 patient_id)
        public
        view
        returns (string memory)
    {
        prev memory pr = prevdates[patient_id];
        return (pr.previous);
    }

    /**
    
     * @param patient_id 
     * @param _blood_test 
     * @param _urine_test 
     * @param _ecg 
     * @param _mri_scan 
     * @param _ct_scan 
     * @param _xray
     * @param _lab_test
     * */

    function investigations(
        uint256 patient_id,
        string memory _blood_test,
        string memory _urine_test,
        string memory _ecg,
        string memory _mri_scan,
        string memory _ct_scan,
        string memory _xray,
        string memory _lab_test
    ) public isOwner {
        t.blood_test = _blood_test;
        t.urine_test = _urine_test;
        t.ecg = _ecg;
        t.mri_scan = _mri_scan;
        t.ct_scan = _ct_scan;
        t.xray = _xray;
        t.lab_test = _lab_test;

        patienttests[patient_id] = t;
    }

    /**
     
     * @param patient_id 
     * */

    function get_investigations(uint256 patient_id)
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            string memory,
            string memory,
            string memory,
            string memory
        )
    {
        tests memory t = patienttests[patient_id];

        return (
            t.blood_test,
            t.urine_test,
            t.ecg,
            t.mri_scan,
            t.ct_scan,
            t.xray,
            t.lab_test
        );
    }

    /**
   
     * @param patient_id
     * @param _built
     * @param _nouirishment 
     * @param _eyes 
     * @param _tongue 
     * @param _pulse 
     * @param _blood_pressure 
     * @param _temp 
     * @param _respiratory_rate 
     */
    function general_examin(
        uint256 patient_id,
        string memory _built,
        string memory _nouirishment,
        string memory _eyes,
        string memory _tongue,
        uint64 _pulse,
        string memory _blood_pressure,
        uint64 _temp,
        uint64 _respiratory_rate
    ) public isOwner {
        s.built = _built;
        s.nouirishment = _nouirishment;
        s.eyes = _eyes;
        s.tongue = _tongue;
        s.pulse = _pulse;
        s.blood_pressure = _blood_pressure;
        s.temp = _temp;
        s.respiratory_rate = _respiratory_rate;

        scantests[patient_id] = s;
    }

    /**

     * @param patient_id 
     * */
    function get_general_examin(uint256 patient_id)
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            string memory,
            uint64,
            string memory,
            uint64,
            uint64
        )
    {
        scan memory s = scantests[patient_id];

        return (
            s.built,
            s.nouirishment,
            s.eyes,
            s.tongue,
            s.pulse,
            s.blood_pressure,
            s.temp,
            s.respiratory_rate
        );
    }

    /**
     
     * @param patient_id 
     * @param _cvs 
     * @param _cns 
     * @param _rs 
     * @param _abdomen 
     */
    function sys_examin(
        uint256 patient_id,
        string memory _cvs,
        string memory _cns,
        string memory _rs,
        string memory _abdomen
    ) public isOwner {
        sys.cvs = _cvs;
        sys.cns = _cns;
        sys.rs = _rs;
        sys.abdomen = _abdomen;

        systemexamine[patient_id] = sys;
    }

    /**
     
     * @param patient_id 
     * */
    function get_sys_examin(uint256 patient_id)
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            string memory
        )
    {
        system memory sys = systemexamine[patient_id];

        return (sys.cvs, sys.cns, sys.rs, sys.abdomen);
    }
}
