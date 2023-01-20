pragma solidity >=0.4.22 <0.7.0;

contract Patient {
    mapping(uint256 => patient) patientlist;
    mapping(uint256 => attendant) attendantlist;

    struct patient {
        string patient_name;
        uint256 age;
        string gender;
        string height;
        uint256 weight;
        string patient_address;
        uint256 phone_no;
        string email_id;
        uint256 date;
        uint256 doctor_id;
        uint256 hospital_id;
    }
    patient p;

    struct attendant {
        uint256 patient_id;
        string attendant_name;
        string attendant_relation;
        uint256 attendant_phn_no;
    }
    attendant a;

    address owner;

    constructor() public {
        owner = 0xE6005Cc724c2d44F0aF23d663017a7E375DD7F35;
    }

    modifier isOwner() {
        require(msg.sender == owner, "Access is not allowed");

        _;
    }

    /**
     * @param patient_id 
     * @param _patient_name 
     * @param _age 
     * @param _gender 
     * @param _height 
     * @param _weight 
     * @param _patient_address 
     * @param _phone_no 
     * @param _email_id 
     * @param _date 
     */
    function store_patient_details(
        uint256 patient_id,
        string memory _patient_name,
        uint256 _age,
        string memory _gender,
        string memory _height,
        uint256 _weight,
        string memory _patient_address,
        uint256 _phone_no,
        string memory _email_id,
        uint256 _date
    ) public isOwner {
        p.patient_name = _patient_name;
        p.age = _age;
        p.gender = _gender;
        p.height = _height;
        p.weight = _weight;
        p.patient_address = _patient_address;
        p.phone_no = _phone_no;
        p.email_id = _email_id;
        p.date = _date;

        patientlist[patient_id] = p;
    }

    /**
    
     * @param patient_id 
     * @param _attendant_name 
     * @param _attendant_relation 
     * @param _attendant_phn_no 
     * */
    function store_attendant_details(
        uint256 patient_id,
        string memory _attendant_name,
        string memory _attendant_relation,
        uint256 _attendant_phn_no
    ) public isOwner {
        a.patient_id = patient_id;
        a.attendant_name = _attendant_name;
        a.attendant_relation = _attendant_relation;
        a.attendant_phn_no = _attendant_phn_no;

        attendantlist[patient_id] = a;
    }

    /**
     
     * @param patient_id 
     * */
    function retreive_patient_details(uint256 patient_id)
        public
        view
        returns (
            string memory,
            uint256,
            string memory,
            string memory,
            uint256,
            string memory,
            uint256,
            string memory,
            uint256
        )
    {
        patient memory p = patientlist[patient_id];

        return (
            p.patient_name,
            p.age,
            p.gender,
            p.height,
            p.weight,
            p.patient_address,
            p.phone_no,
            p.email_id,
            p.date
        );
    }

    /**
     
     * @param patient_id 
     * */
    function retreive_attendant_details(uint256 patient_id)
        public
        view
        returns (
            string memory,
            string memory,
            uint256
        )
    {
        attendant memory a = attendantlist[patient_id];

        return (a.attendant_name, a.attendant_relation, a.attendant_phn_no);
    }
}
