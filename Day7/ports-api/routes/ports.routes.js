import {Router} from 'express';
import "../controllers/ports.controller.js"
import { createPort, deletePort, getAllPorts, getPortByCode } from "../controllers/ports.controller.js";
const router=Router();


router.get('/',getAllPorts);
router.get("/:code",getPortByCode);
router.post("/",createPort);
router.delete("/:code",deletePort);

export default router;