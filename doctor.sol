pragma solidity >=0.4.22 <0.7.0;

contract Doctor {
    mapping(uint256 => doctor) doctorlist;

    struct doctor {
        string doctor_name;
        string doctor_specialisation;
        uint256 doctor_ph_no;
        string doctor_address;
    }
    doctor d;

    address owner;

    constructor() public {
        owner = 0xE6005Cc724c2d44F0aF23d663017a7E375DD7F35;
    }

    modifier isOwner() {
        require(msg.sender == owner, "Access is not allowed");

        _;
    }

    /**
     * @dev
     * @param doctor_id
     * @param _doctor_name
     * @param _doctor_specialisation
     * @param _doctor_ph_no
     */
    function store_doctor_details(
        uint16 doctor_id,
        string memory _doctor_name,
        string memory _doctor_specialisation,
        uint256 _doctor_ph_no,
        string memory _doctor_address
    ) public isOwner {
        d.doctor_name = _doctor_name;
        d.doctor_specialisation = _doctor_specialisation;
        d.doctor_ph_no = _doctor_ph_no;
        d.doctor_address = _doctor_address;

        doctorlist[doctor_id] = d;
    }

    /**
     * @dev
     * @param doctor_id
     * */
    function retreive_doctor_details(uint16 doctor_id)
        public
        view
        returns (
            string memory,
            string memory,
            uint256,
            string memory
        )
    {
        doctor memory d = doctorlist[doctor_id];

        return (
            d.doctor_name,
            d.doctor_specialisation,
            d.doctor_ph_no,
            d.doctor_address
        );
    }
}
