import { readFileSync, stat } from "fs";
import { join } from "path";

const dataPath = join(import.meta.dirname, "../data/ports.json");
let ports = JSON.parse(readFileSync(dataPath, "utf-8"));

const ok = (res, data, status = 200) =>
    res.status(status).json({ success: true, data });
const fail = (res, message, status) =>
    res.status(status).json({ success: false, error: message });

export const getAllPorts = (req, res, next) => {
    // next({statusCode:500,errorMessage:'jkla',code:'dkjal'});
    const { country, status, port_role, page, limit } = req.query;
    let result = [...ports];
    if (country) {
        result = result.filter((p) => p.country.toLowerCase() === country.toLowerCase());
    }
    if (status) {
        result = result.filter((p) => p.status.toLowerCase() === status.toLowerCase());
    }
    if (port_role) {
        result = result.filter((p) => p.port_role.toLowerCase() === port_role.toLowerCase());
    }
    const pageNum = Math.max(1, parseInt(page) || 1);
    const limitNum = Math.min(100, Math.max(1, parseInt(limit) || 10));
    const total = result.length;
    const totalPages = Math.ceil(total / limitNum);
    const start = (pageNum - 1) * limitNum;
    const paginated = result.slice(start, start + limitNum);

    ok(res, {
        ports: paginated,
        pagination: { total, page: pageNum, limit: limitNum, totalPages },
    });
}
export const getPortByCode = (req, res) => {
    const { code } = req.params;
    const port = ports.find(
        (p) => p.unlocode.toLowerCase() === code.toLowerCase()
    );
    if (!port) {
        return fail(res, `Port with unlocode ${code} not found`, 404);
    }
    ok(res, port);
}

export const createPort = (req, res) => {
    const { unlocode, name, country } = req.body;
    const missing = [];
    if (!unlocode) missing.push("unlocode");
    if (!name) missing.push("name");
    if (!country) missing.push("country");

    if (missing.length > 0) {
        return fail(res, `Missing required fields: ${missing.join(", ")}`, 404);
    }
    const exists = ports.some(
        (p) => p.unlocode.toLowerCase() === unlocode.toLowerCase()
    );
    if (exists) {
        return fail(res, `A port with unlocode ${unlocode} already exists`, 400);
    }

    const newPort = { ...req.body, unlocode: unlocode.toUpperCase() };
    ports.push(newPort);
    ok(res, newPort);
}

export const deletePort = (req, res) => {
    const { code } = req.params;
    const index = ports.findIndex((p) => p.unlocode.toLowerCase() == code.toLowerCase());
    if (index == -1) {
        return fail(res, `Missing that unlocode ${code} port`, 404);
    }
    ports.pop(index);
    ok(res, { message: `Port ${code} removed successfully` });
}